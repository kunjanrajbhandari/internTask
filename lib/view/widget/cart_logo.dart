import 'package:flutter/material.dart';
import 'package:intern_task/controller/provider/cart_provider.dart';
import 'package:provider/provider.dart';

class CartLogo extends StatelessWidget {
  const CartLogo({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //width: 55.0,
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Padding(
            padding:  EdgeInsets.only(right:3.0, ),
            child: Image(image: AssetImage("assets/images/cart1.png"), height: 30,),
          ),
          Consumer<Cart>(
            builder: (context,provider, child){
              return provider.totalCartCount !=0?Padding(
                padding: const EdgeInsets.only(right:2.5,bottom: 0),
                child: Container(
                  height: 14.5,width: 14.5 ,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(33.0)
                  ),
                  child: Center(child: Text("${provider.totalCartCount}", style: TextStyle(fontWeight: FontWeight.w400, color: Colors.white, fontSize: 9.0),))
                ),
              ):const SizedBox();
            }
          )
        ],
      ),
  );
  }
}