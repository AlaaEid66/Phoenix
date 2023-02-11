import 'package:flutter/material.dart';
import 'package:phoenix/registration/signIn.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:device_preview/device_preview.dart';
void main() {

  runApp(DevicePreview(
      builder:(context)=> MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder:DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      home: SignIn(),
    );
  }
}


