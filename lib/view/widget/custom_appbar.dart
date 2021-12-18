
import 'package:flutter/material.dart';
import 'package:intern_task/controller/provider/cart_provider.dart';
import 'package:intern_task/view/cart.dart';
import 'package:intern_task/view/widget/cart_logo.dart';
import 'package:provider/provider.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({ Key? key }) : super(key: key);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:0.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 88.0,
        color: Colors.black.withOpacity(0.07),
        child: Padding(
          padding: const EdgeInsets.only(left: 22.0,right: 22,bottom: 8.0),
          child: Row(

            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              IconButton(onPressed: (){
                Navigator.pop(context);
              }, icon: Icon(Icons.arrow_back_ios, color: Colors.black,)),
              
              GestureDetector(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  CartScreen()));
                },
                child: CartLogo(),
              )
            ],
          ),
        ),
        
      ),
    );
  }
}