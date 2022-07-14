import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

import 'loginscreen.dart';


class Splash_Screen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    return SplashScreen(
      seconds: 6,
      navigateAfterSeconds: Login_Screen(),
      title: Text('Shield'),
      image: Image.asset('assets/splash.jpg',width: mq.width*0.6,height: mq.height*0.7,),
      backgroundColor: Colors.orange,
      loaderColor: Colors.white,
    );
  }
}