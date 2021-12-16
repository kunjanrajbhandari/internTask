
import 'package:flutter/material.dart';
import 'package:intern_task/controller/provider/add_to_cart.dart';
import 'package:intern_task/view/cart.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({ Key? key }) : super(key: key);

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
              }, icon: Icon(Icons.arrow_back_ios, color: Colors.white,)),

              GestureDetector(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  MyCart()));
                },
                child: Image(image: AssetImage("assets/images/cart1.png"), height: 35,),
              )
            ],
          ),
        ),
        
      ),
    );
  }
}