import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wash_man/notification/notifyHelper.dart';
import 'package:wash_man/screens/homeScreen.dart';
import 'package:wash_man/screens/signupscreen.dart';
import 'package:wash_man/theme/themeService.dart';
import '../controller/authController.dart';


class Login_Screen extends StatefulWidget{
  @override
  State<Login_Screen> createState() => _Login_ScreenState();
}

class _Login_ScreenState extends State<Login_Screen> {


  final _formkey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context){
    final mq = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff653bbf),
        centerTitle: true,
        //backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        leading: GestureDetector(
          onTap: (){
            ThemeService().SwitchTheme();
          },
          child: Icon(Icons.nightlight_round,color: Colors.black,),
        ),
        elevation: 0,
        title: const Text('Sign In',
        style: TextStyle(fontSize: 16,fontWeight: FontWeight.w800,color: Colors.black),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              TextFormField(
                onSaved: (value){
                  emailController.text = value!;
                },
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(20),
                  border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
                labelText: 'Email',
                labelStyle: TextStyle(color: Colors.grey,fontWeight: FontWeight.w600,fontSize: 14),
                  ),
                textInputAction: TextInputAction.next,
                ),
                SizedBox(height: 20),

                TextFormField(
                  onSaved: (value){
                    passwordController.text = value!;
                  },
                   obscureText: true,
                   controller: passwordController,
                   decoration: const InputDecoration(
                   contentPadding: EdgeInsets.all(20),
                   border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
                   labelText: 'Password',
                   labelStyle: TextStyle(color: Colors.grey,fontWeight: FontWeight.w600,fontSize: 14),
                 ),
                  textInputAction: TextInputAction.next,
                ),
                SizedBox(height: 10),
            GestureDetector(
              onTap: (){
                   AuthController.instance.Login(emailController.text.trim(), passwordController.text.trim());
                },
              child: Container(
                height: mq.height*0.055,
                width: mq.width,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Color(0xff653bbf),
                ),
                child: const Center(
                  child: Text('Sign In',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 15.0)
                  ),
                ),
              ),
            ),
            SizedBox(height: mq.height*0.015),

            GestureDetector(
              onTap: (){    
                Get.to(SignUp_Screen());
              },
              child: const Center(
                child: Text('Don\'t have an account?',
                style: TextStyle(color: Color(0xff653bbf), fontWeight: FontWeight.w600, fontSize: 15.0)
                ),
              ),
            ),
            SizedBox(height: mq.height*0.05),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(width: 80, height: 1.0, color: Colors.black12),
                SizedBox(width: mq.width*0.02),
                Text('OR', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w600, fontSize: 12.0)),
                SizedBox(width: mq.width*0.02),
                Container(width: 80, height: 1.0, color: Colors.black12),
              ],
            ),
            SizedBox(height: 20),
            Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            buildButton(mq,'assets/google.png'),
            buildButton(mq,'assets/fb.png'),
            buildButton(mq, 'assets/apple.png')
              ],
            ),
          ]),
        ),
      ),
    );
  }
}

Widget buildButton(Size mq,String img){
  return GestureDetector(
    onTap: (){},
    child: Container(
      height: mq.height*0.06,
      //width: mq.width/2-40,
      child: Image.asset(img),
    ),
  );
}

