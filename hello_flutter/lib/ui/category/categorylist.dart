import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hello_flutter/model/drink.dart';
import 'package:hello_flutter/ui/detail/detail.dart';

class CategoryList extends StatefulWidget {
  final List<Drink> drinks;

  const CategoryList({Key? key, required this.drinks}) : super(key: key);

  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: widget.drinks.length,
        itemBuilder: (BuildContext context, int index) {
          return listItem(context, widget.drinks[index]);
        },
      ),
    );
  }
}

Widget listItem(BuildContext context, Drink drink) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DetailScreen(
            drink: drink,
          ),
        ),
      );
    },
    child: Container(
      height: 230,
      alignment: Alignment.bottomCenter,
      child: Stack(
        children: [
          CachedNetworkImage(
            imageUrl: drink.strDrinkThumb,
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
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              color: Colors.black.withOpacity(0.7),
              height: 60,
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      drink.strDrink,
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
                    "#${drink.idDrink}",
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
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
