import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HomeBannerWidget extends StatelessWidget {
  const HomeBannerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        loadCachedImage(),
        loadBottomView(context),
      ],
    );
  }

  CachedNetworkImage loadCachedImage() {
    return CachedNetworkImage(
      imageUrl:
          "https://www.thecocktaildb.com/images/media/drink/l3cd7f1504818306.jpg",
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
    );
  }

  Widget loadBottomView(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        color: Colors.black.withOpacity(0.6),
        height: 40,
        child: Padding(
          padding: EdgeInsets.only(left: 10.0, right: 10.0),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  "Title",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  "#1234",
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
