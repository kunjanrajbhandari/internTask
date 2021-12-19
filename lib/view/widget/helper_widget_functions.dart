import 'package:flutter/material.dart';

Widget getProductImage(String? imageName ,double height){
  return Image(image:  NetworkImage("https://electronic-ecommerce.herokuapp.com/$imageName"),height: height);
}

bool checkStock(int value){
  if(value != 0){
    return true;
  }
  else{
    return false;
  }
}

double convertPrice(String value){
  String convertToInt = value.substring(1);
  int priceInt = int.parse(convertToInt);
  double priceDouble = priceInt.toDouble();
  double nepalprice = priceDouble*120;
  return nepalprice;
}
