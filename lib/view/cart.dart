import 'package:flutter/material.dart';

class MyCart extends StatefulWidget {
  const MyCart({ Key? key }) : super(key: key);

  @override
  _MyCartState createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add to cart"),
      ),
      
    );
  }
}