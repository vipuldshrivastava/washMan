import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wash_man/controller/authController.dart';


class SignUp_Screen extends StatefulWidget{
  @override
  State<SignUp_Screen> createState() => _SignUp_ScreenState();
}

class _SignUp_ScreenState extends State<SignUp_Screen> {


    final FirstNameController = TextEditingController();
    final SecondNameController = TextEditingController();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final reEnterPasswordController = TextEditingController();


  @override
  Widget build(BuildContext context){
    final mq = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        leading: GestureDetector(
          onTap: (){
            Get.back();
          },
          child: Icon(Icons.arrow_back_ios,color: Colors.black,)),
        title: Text('Sign UP',
        style: TextStyle(fontSize: 16,fontWeight: FontWeight.w800,color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            buildTextField(
              'First Name',
              FirstNameController,
              false
              ),
            SizedBox(height: mq.height*0.02,),
            buildTextField(
              'Second name',
              SecondNameController,
              false
              ),
            SizedBox(height: mq.height*0.02,),
            buildTextField(
              'Email',
              emailController,
              false
              ),
            SizedBox(height: mq.height*0.02,),
            buildTextField(
              'Password',
              passwordController,
              true,
              ),
            SizedBox(height: mq.height*0.02,),
            buildTextField(
              'Re-enter password',
              reEnterPasswordController,
              false,
              ),
            SizedBox(height: mq.height*0.026,),
            GestureDetector(
              onTap: (){
                AuthController.instance.SignUp(emailController.text.trim(), passwordController.text.trim());
              },
              child: Container(
                height: mq.height*0.055,
                width: mq.width,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Color(0xff653bbf),
                ),
                child: const Center(
                  child: Text('Sign UP',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 15.0)
                  ),
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
            SizedBox(height: 10),
            Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            buildButton(mq,'assets/google.png'),
            buildButton(mq,'assets/fb.png'),
            buildButton(mq,'assets/apple.png')
              ],
            ),
          ]),
        ),
      ),
    );
  }
}

Widget buildTextField(String text,TextEditingController controller,bool ot){
  return TextFormField(
    onSaved: (value){
      controller.text = value!;
    },
    obscureText: ot,
    controller: controller,
    decoration: InputDecoration(
      contentPadding: EdgeInsets.all(20),
      border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
      labelText: text,
      labelStyle: TextStyle(color: Colors.grey,fontWeight: FontWeight.w600,fontSize: 14),
    ),
  );
}

Widget buildButton(Size mq,String img){
  return GestureDetector(
    onTap: (){},
    child: Container(
      height: 40,
      width: 40,
      child:Image.asset(img,height: 15,width: 30,),
    ),
    );
}