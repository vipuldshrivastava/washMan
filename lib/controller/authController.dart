import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:wash_man/screens/homeScreen.dart';

import '../screens/loginscreen.dart';

class AuthController extends GetxController{
  static AuthController instance = Get.find();
  late Rx<User?> _user;
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void onReady(){
    super.onReady();
    _user = Rx<User?>(auth.currentUser);
    _user.bindStream(auth.userChanges());
    ever(_user, _initialScreen);
  }

  _initialScreen(User? user){
    if(user==null){
      print("logIn page");
      Get.offAll(()=>Login_Screen());
    }else{
      Get.offAll(()=>HomeScreen());
    }
  }
  void SignUp(String email,String password)async{
    try{
        await  auth.createUserWithEmailAndPassword(email: email, password: password);
    }catch(e){
      Get.snackbar("About user", "User mesaage",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.deepPurple,
      titleText: Text("SignUp failed",style: TextStyle(color: Colors.black),),
      messageText: Text(e.toString())
      );
    }
  }
    void Login(String email,String password)async{
    try{
        await  auth.signInWithEmailAndPassword(email: email, password: password);
    }catch(e){
      Get.snackbar("About LogIn", "LogIn mesaage",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.deepPurple,
      titleText: Text("LogIn failed",style: TextStyle(color: Colors.black),),
      messageText: Text(e.toString())
      );
    }
  }
  void LogOut()async{
    await auth.signOut();
  }
}