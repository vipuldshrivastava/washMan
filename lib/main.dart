// @dart=2.9

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:wash_man/controller/authController.dart';
import 'package:wash_man/notification/notifyHelper.dart';
import 'package:wash_man/screens/homeScreen.dart';
import 'package:wash_man/screens/loginscreen.dart';
import 'package:wash_man/screens/splashscreen.dart';
import 'package:wash_man/theme/themeService.dart';
import 'package:wash_man/theme/themes.dart';

Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((Value)=>Get.put(AuthController()));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Themes.light,
      darkTheme: Themes.dark,
      themeMode: ThemeService().theme,

      home: Login_Screen(),
    );
  }
}