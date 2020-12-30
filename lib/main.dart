import 'package:flutter/material.dart';
import 'package:youtube_app/config/appTheme.dart';
import 'package:youtube_app/ui/Screen/HomeScreen/homeScreen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: MenuScreenMain(),
    );
  }
}
