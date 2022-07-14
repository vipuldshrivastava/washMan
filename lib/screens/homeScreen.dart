import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wash_man/controller/authController.dart';
import 'package:wash_man/notification/notifyHelper.dart';

import '../theme/themeService.dart';



class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key,}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  var notificationHelper;
  void initState(){
    super.initState();
    notificationHelper = NotificationHelper();
    notificationHelper.initializeNotification();
  }

  @override
  Widget build(BuildContext context) {
    String email;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff653bbf),
        centerTitle: true,
        //backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        leading: GestureDetector(
          onTap: (){
            ThemeService().SwitchTheme();
            notificationHelper.displayNotification(
              title: "Theme Changed",
              body: Get.isDarkMode?"Activated Dark Theme":"Activated Light theme"
            );
          },
          child: Icon(Icons.nightlight_round,color: Colors.black,),
        ),
        elevation: 0,
        title: const Text('Welcome',
        style: TextStyle(fontSize: 16,fontWeight: FontWeight.w800,color: Colors.black),
        ),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Welcome Back",
            style: TextStyle(fontSize: 22,fontWeight: FontWeight.w700,color: Colors.blueAccent),),
            const SizedBox(height: 5),
            Text("email",
            style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600,color: Colors.black),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: (){
                AuthController.instance.LogOut();
              },
              child: Container(
                height: 35,
                width: 125,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.deepPurple,
                ),
                child: Center(child: Text('Logout',
                style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold
                ),)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}