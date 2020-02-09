import 'package:flutter/material.dart';
import '../shared/Product.dart';
import '../shared/colors.dart';

Widget shopItem(Product category,
    {double imgWidth, onTapped, bool isProductPage = false}) {

  return Container(
    width: 180,
    height: 180,
    margin: EdgeInsets.only(left: 20),
    child: Stack(
      children: <Widget>[
        Container(
            width: 180,
            height: 180,
            child: RaisedButton(
                color: white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                onPressed: onTapped,
                child: Hero(
                    transitionOnUserGestures: true,
                    tag: category.name,
                    child: Image.asset(category.image,
                        width: (imgWidth != null) ? imgWidth : 100)))),
      ],
    ),
  );
}
