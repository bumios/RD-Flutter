import 'package:flutter/material.dart';
import 'package:hello_flutter/splash.dart';

void main() {
  runApp(NavigationApp());
}

class NavigationApp extends StatelessWidget {
  final bool isLoggedIn = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "/": (context) => SplashScreen(),
        // DetailScreen.routeName: (context) => DetailScreen(),
      },
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Text("Some thing"),
      ),
      floatingActionButton: Text("Tap me"),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Text("Hello I'm back"),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, DetailScreen.routeName);
                },
                child: Text("Move to detail"),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key}) : super(key: key);

  static const routeName = "/detail";

  @override
  Widget build(BuildContext context) {
    return Text("Hello I'm back");
  }
}
