import 'package:flutter/material.dart';
import 'package:intern_task/controller/provider/product.dart';
import 'package:provider/provider.dart';

class SelectCategory extends StatelessWidget {
  String? categoryName;
   SelectCategory({ Key? key, required this.categoryName}) : super(key: key);
  var _items ;
  @override
  Widget build(BuildContext context) {
    return Padding(
    padding: const EdgeInsets.only(left:18.0, bottom: 5.0),
    child: Row(
      children: [
        
        GestureDetector(
          onTap: (){
            Provider.of<ProductDetails>(context,listen: false).getItem(categoryName!);
            Provider.of<ProductDetails>(context,listen: false).getcategory(categoryName);
            _items = categoryName;
            // Provider.of<ProductDetails>(context, listen: false).productName = _items;
            // print(Provider.of<ProductDetails>(context, listen: false).productName);
          },
          child: Container(
            height: 22.0,
            width: 77.0,
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(11)
            ),
            child: Center(child: Text(categoryName!.substring(11), style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w500, color: Colors.white),)))
          ),
      ],
    ),
    );
  }
}