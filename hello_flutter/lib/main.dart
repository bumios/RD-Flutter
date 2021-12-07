import 'package:flutter/material.dart';
import 'package:hello_flutter/splash.dart';
import 'package:hello_flutter/login/login.dart';

void main() {
  runApp(NavigationApp());
}

class NavigationApp extends StatelessWidget {
  final bool isLoggedIn = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.yellowAccent),
      routes: {
        "/": (context) => SplashScreen(),
      },
    );
  }
}
