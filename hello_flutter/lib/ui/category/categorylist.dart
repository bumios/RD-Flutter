import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hello_flutter/model/dish.dart';
import 'package:hello_flutter/ui/detail/detail.dart';

class CategoryList extends StatefulWidget {
  final List<Dish> dishes;

  const CategoryList({Key? key, required this.dishes}) : super(key: key);

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
        itemCount: widget.dishes.length,
        itemBuilder: (BuildContext context, int index) {
          return listItem(context, widget.dishes[index]);
        },
      ),
    );
  }
}

Widget listItem(BuildContext context, Dish dish) {
  return GestureDetector(
    onTap: () {
      Navigator.pushNamed(context, DetailScreen.routeName);
    },
    child: Container(
      height: 200,
      alignment: Alignment.bottomCenter,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(dish.imageUrl),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        color: Colors.black.withOpacity(0.7),
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  dish.name,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    fontSize: 20,
                  ),
                ),
                Text(
                  dish.description,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
            Text(
              dish.price,
              style: TextStyle(
                color: Theme
                    .of(context)
                    .primaryColor,
                fontWeight: FontWeight.w800,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
