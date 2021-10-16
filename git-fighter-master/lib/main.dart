import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:git_fighter/screens/splash_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Git Fighter',
        theme: ThemeData(
            brightness: Brightness.dark, primaryColor: Colors.yellowAccent),
        darkTheme: ThemeData.dark(),
        home: SplashScreen());
  }
}
