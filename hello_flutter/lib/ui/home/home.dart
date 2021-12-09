import 'package:flutter/material.dart';
import 'package:hello_flutter/model/drink.dart';
import 'package:hello_flutter/ui/category/categories.dart';
import 'package:hello_flutter/ui/home/banner/homebannerwidget.dart';
import 'package:http/http.dart' as http;
import 'dart:convert'; // Để sử dụng func jsonDecode()

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<DrinkList> cocktailList;
  late Future<DrinkList> cocoaList;
  late Future<DrinkList> shotList;
  late Future<DrinkList> beerList;

  @override
  void initState() {
    super.initState();
    // Request API
    cocktailList = fetchDrinkListAPIWith(BannerType.cocktail);
    cocoaList = fetchDrinkListAPIWith(BannerType.cocoa);
    shotList = fetchDrinkListAPIWith(BannerType.shot);
    beerList = fetchDrinkListAPIWith(BannerType.beer);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Home", style: TextStyle(color: Colors.white)),
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: Colors.black,
          actions: [
            IconButton(
              icon: new Icon(
                Icons.logout,
                color: Colors.white,
              ),
              onPressed: () {
                print("[TODO] Handle logout action");
              },
            ),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: loadBannerWith(BannerType.cocktail),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: loadBannerWith(BannerType.cocoa),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Expanded(
                          child: loadBannerWith(BannerType.shot),
                        ),
                        Expanded(
                          child: loadBannerWith(BannerType.beer),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  FutureBuilder<DrinkList> loadBannerWith(BannerType type) {
    Future<DrinkList> listType;

    switch (type) {
      case BannerType.cocktail:
        listType = cocktailList;
        break;
      case BannerType.cocoa:
        listType = cocoaList;
        break;
      case BannerType.shot:
        listType = shotList;
        break;
      case BannerType.beer:
        listType = beerList;
        break;
    }

    return FutureBuilder<DrinkList>(
      future: listType,
      builder: (context, snapshot) {
        if (snapshot.hasData && snapshot.data != null) {
          // Safe unwrapped
          if (snapshot.data!.drinks != null) {
            return HomeBannerWidget(
              type: type,
              itemsCount: snapshot.data!.drinks!.length,
              imageUrl: snapshot.data!.drinks![0].strDrinkThumb,
              onTapCallback: () {
                // listType.drinks
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CategoriesScreen()),
                );
                // Navigator.pushNamed(context, CategoriesScreen.routeName);
              },
            );
          }
        }
        return HomeBannerWidget(
          type: type,
          itemsCount: 0,
        );
      },
    );
  }
}

Future<DrinkList> fetchDrinkListAPIWith(BannerType type) async {
  final response = await http.get(Uri.parse(
      "https://www.thecocktaildb.com/api/json/v1/1/filter.php?c=${type.apiValue}"));

  if (response.statusCode == 200) {
    return DrinkList.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load drink list');
  }
}
