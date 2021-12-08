import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartView extends StatefulWidget {
  final int count;

  const CartView({Key? key, required this.count}) : super(key: key);

  @override
  _CartViewState createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: () {},
        child: Stack(
          children: [
            new IconButton(
              icon: new Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ),
              onPressed: null,
            ),
            widget.count == 0
                ? Container()
                : Positioned(
                    top: 4.0,
                    right: 4.0,
                    child: Stack(
                      children: [
                        new Icon(
                          Icons.brightness_1,
                          size: 20.0,
                          color: Theme.of(context).primaryColor,
                        ),
                        Positioned(
                          top: 4.0,
                          right: 6.0,
                          child: Center(
                            child: Text(
                              widget.count.toString(),
                              style: new TextStyle(
                                  color: Colors.black,
                                  fontSize: 11.0,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
