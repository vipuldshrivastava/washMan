import 'dart:html';

import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        leading: GestureDetector(
          onTap: (){},
          child: Icon(Icons.nightlight_round),
        ),
        title: const Text('Sign In',
        style: TextStyle(fontSize: 16,fontWeight: FontWeight.w800,color: Colors.black),
        ),
      );
  }
}