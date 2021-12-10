import 'package:flutter/material.dart';
import 'package:hello_flutter/model/drink.dart';
import 'package:hello_flutter/ui/category/categorylist.dart';
import 'package:hello_flutter/ui/commonwidget/cart.dart';

class CategoriesScreen extends StatefulWidget {
  static const String routeName = "/categories";

  final String screenTitle;
  final List<Drink> drinks;

  const CategoriesScreen({
    Key? key,
    required this.screenTitle,
    required this.drinks,
  }) : super(key: key);

  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Scaffold(
              extendBodyBehindAppBar: true,
              appBar: AppBar(
                title: Text(widget.screenTitle,
                    style: TextStyle(color: Colors.white)),
                iconTheme: IconThemeData(color: Colors.white),
                backgroundColor: Colors.black.withOpacity(0.6),
                elevation: 0.0,
                actions: [
                  CartView(
                    count: widget.drinks.length,
                  ),
                ],
              ),
              body: Container(
                alignment: Alignment.topLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: CategoryList(
                        drinks: widget.drinks,
                      ),
                    )
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
