import 'package:flutter/material.dart';
import 'package:hello_flutter/model/dish.dart';
import 'package:hello_flutter/ui/category/categorylist.dart';
import 'package:hello_flutter/ui/commonwidget/cart.dart';

class CategoriesScreen extends StatefulWidget {
  static const String routeName = "/categories";

  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  final dishes = [
    Dish(
      "Sukem",
      "Cream, cold",
      "40.000 VND",
      "https://www.thatlangon.com/wp-content/uploads/2020/06/8512img_5ed7c21ab4641.jpg",
    ),
    Dish(
      "Cake",
      "Happy birthday, cold",
      "120.000 VND",
      "https://images-gmi-pmc.edge-generalmills.com/99d8ae9a-737f-491c-a7f7-34b014e5682c.jpg",
    ),
    Dish(
      "Roll cake",
      "Cream, cold",
      "40.000 VND",
      "https://www.thatlangon.com/wp-content/uploads/2020/09/3-1.jpg",
    ),
    Dish(
      "Tiramisu",
      "Cream, cold",
      "55.000 VND",
      "https://cdn.cet.edu.vn/wp-content/uploads/2018/01/tiramisu-duoc-che-bien-khac-nhau.jpg",
    ),
    Dish(
      "Cheesecake",
      "Cheese, cold",
      "55.000 VND",
      "https://cdn.tgdd.vn/Files/2021/08/12/1374818/huong-dan-cach-lam-cheesecake-chanh-leo-thom-ngon-beo-ngay-202108121957189292.jpg",
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.topLeft,
        decoration: BoxDecoration(
          image: DecorationImage(
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.7), BlendMode.srcOver),
            image: ExactAssetImage('assets/images/img_background_splash.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              color: Colors.black.withOpacity(0.7),
              padding: const EdgeInsets.only(
                  top: 30.0, left: 10.0, right: 10.0, bottom: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Image.asset('assets/images/ic_back.png', scale: 25),
                  Text("Detail",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 0.5,
                        fontSize: 25,
                      )),
                  CartView(
                    count: dishes.length,
                  ),
                ],
              ),
            ),
            Expanded(
              child: CategoryList(
                dishes: dishes,
              ),
            )
          ],
        ),
      ),
    );
  }
}
