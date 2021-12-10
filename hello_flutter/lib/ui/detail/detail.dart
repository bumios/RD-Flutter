import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hello_flutter/model/drink.dart';
import 'package:hello_flutter/ui/commonwidget/cart.dart';
import 'package:http/http.dart' as http;
import 'dart:convert'; // Để sử dụng func jsonDecode()

class DetailScreen extends StatefulWidget {
  static const String routeName = "/detail";

  final Drink drink;

  const DetailScreen({Key? key, required this.drink}) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late Future<DrinkList> fetchedDrink;

  @override
  void initState() {
    super.initState();
    // Request API
    fetchedDrink = fetchDrinkDetailAPI();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Scaffold(
              extendBodyBehindAppBar: true,
              appBar: AppBar(
                title: Text(widget.drink.strDrink,
                    style: TextStyle(color: Colors.white)),
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
                    Expanded(
                      child: Stack(
                        children: [
                          loadBackgroundImage(),
                          loadGradient(),
                          loadDescriptionContent(context),
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

  // UI
  Container loadBackgroundImage() {
    return Container(
      child: CachedNetworkImage(
        imageUrl: widget.drink.strDrinkThumb,
        imageBuilder: (context, imageProvider) => Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.cover,
            ),
          ),
        ),
        placeholder: (context, url) => CircularProgressIndicator(),
        errorWidget: (context, url, error) => Icon(Icons.error),
      ),
    );
  }

  Container loadGradient() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.transparent,
            Colors.transparent,
            Colors.black,
            Colors.black,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0, 0.3, 1, 1],
        ),
      ),
    );
  }

  Container loadDescriptionContent(BuildContext context) {
    return Container(
      color: Colors.black.withOpacity(0.5),
      alignment: Alignment.bottomCenter,
      padding: EdgeInsets.all(10.0),
      child: Column(
        children: [
          Expanded(child: Container()),
          loadDescriptionText(),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  widget.drink.strDrink,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                  maxLines: 2,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "#${widget.drink.idDrink}",
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  FutureBuilder<DrinkList> loadDescriptionText() {
    return FutureBuilder<DrinkList>(
      future: fetchedDrink,
      builder: (context, snapshot) {
        if (snapshot.hasData && snapshot.data != null) {
          final drinks = snapshot.data!.drinks;
          // Safe unwrapped
          if (drinks != null) {
            return Text(
              drinks[0].strInstructions!,
              style: TextStyle(
                color: Colors.white70,
              ),
            );
          }
        }
        return Text("Loading information...",
            style: TextStyle(
              color: Colors.white70,
            ));
      },
    );
  }

  // API
  Future<DrinkList> fetchDrinkDetailAPI() async {
    final response = await http.get(Uri.parse(
        "https://www.thecocktaildb.com/api/json/v1/1/lookup.php?i=${widget.drink.idDrink}"));

    if (response.statusCode == 200) {
      return DrinkList.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load drink list');
    }
  }
}
