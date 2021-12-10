import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hello_flutter/ui/commonwidget/cart.dart';

class DetailScreen extends StatefulWidget {
  static const String routeName = "/detail";

  const DetailScreen({Key? key}) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Scaffold(
              extendBodyBehindAppBar: true,
              appBar: AppBar(
                title: Text("XXX", style: TextStyle(color: Colors.white)),
                iconTheme: IconThemeData(color: Colors.white),
                backgroundColor: Colors.transparent,
                elevation: 0.0,
                actions: [
                  CartView(
                    count: 10,
                  ),
                ],
              ),
              body: Container(
                child: Column(
                  children: [
                    Container(
                      height: 250.0,
                      width: double.infinity,
                      alignment: Alignment.topCenter,
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(
                                    'assets/images/img_background_splash.png'),
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Colors.black,
                                  Colors.black,
                                  Colors.transparent,
                                  Colors.transparent
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                stops: [0, 0, 0.7, 0],
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: Container(
                              color: Colors.black.withOpacity(0.5),
                              alignment: Alignment.bottomCenter,
                              padding: EdgeInsets.all(10.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    "aa",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w800,
                                      fontSize: 15,
                                    ),
                                  ),
                                  Text(
                                    "aaa",
                                    style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontWeight: FontWeight.w800,
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
