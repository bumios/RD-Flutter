import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

enum BannerType { cocktail, cocoa, shot, beer }

extension BannerTypeExtension on BannerType {
  String get title {
    // Uppercases
    final myString = this.toString().split('.').last;
    return "${myString[0].toUpperCase()}${myString.substring(1)}";
  }

  String get apiValue {
    return this.toString().split('.').last;
  }
}

class HomeBannerWidget extends StatelessWidget {
  const HomeBannerWidget({
    Key? key,
    required this.type,
    required this.itemsCount,
    this.imageUrl = "",
    this.onTapCallback,
  }) : super(key: key);

  final BannerType type;
  final int itemsCount;
  final String imageUrl;
  final VoidCallback? onTapCallback;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onTapCallback != null) {
          onTapCallback!();
        }
      },
      child: Stack(
        children: [
          imageUrl.isNotEmpty ? loadCachedImage() : Container(),
          loadBottomView(context),
        ],
      ),
    );
  }

  CachedNetworkImage loadCachedImage() {
    return CachedNetworkImage(
      imageUrl: imageUrl,
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
                  type.title,
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
                  "$itemsCount items",
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
