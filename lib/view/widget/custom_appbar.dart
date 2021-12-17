
import 'package:flutter/material.dart';
import 'package:intern_task/controller/provider/add_to_cart.dart';
import 'package:intern_task/view/cart.dart';
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
                child: Stack(
                  alignment: Alignment.topRight,
                  children: [
                    const Padding(
                      padding:  EdgeInsets.only(right:2.0),
                      child: Image(image: AssetImage("assets/images/cart1.png"), height: 35,),
                    ),
                    Consumer<Cart>(
                      builder: (context,provider, child){
                        return provider.count !=0?Container(
                          height: 20,width: 20 ,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(33.0)
                          ),
                          child: Center(child: Text("${provider.count}", style: TextStyle(fontWeight: FontWeight.w400, color: Colors.white, fontSize: 14.0),))
                        ):const SizedBox();
                      }
                    )
                     
                     
                    //
                  ],
                ),
              )
            ],
          ),
        ),
        
      ),
    );
  }
}