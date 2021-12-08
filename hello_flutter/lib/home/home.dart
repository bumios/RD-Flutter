import 'package:flutter/material.dart';
import 'package:hello_flutter/home/banner/homebannerwidget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        brightness: Brightness.light,
        title: Text("Home"),
      ),
      body: Column(
        children: [
          Expanded(
            child: HomeBannerWidget(),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: HomeBannerWidget(),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Expanded(
                        child: HomeBannerWidget(),
                      ),
                      Expanded(
                        child: HomeBannerWidget(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
