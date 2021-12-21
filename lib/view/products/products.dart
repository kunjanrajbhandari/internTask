import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intern_task/controller/provider/cart_provider.dart';
import 'package:intern_task/controller/unix_to_normal_time.dart';
import 'package:intern_task/view/single.dart';
import 'package:intern_task/view/widget/helper_widget_functions.dart';
import 'package:provider/provider.dart';

class Products extends StatelessWidget {
  int id;
  String productName;
  String imageName;
  double price;
  int stock;
  int createdDate;
   Products({ Key? key, required this.id, required this.productName, required this.imageName, required this.price, required this.stock, required this.createdDate }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        if(stock != 0){

          Navigator.of(context).push(MaterialPageRoute(builder: (context) => SinglePage(
            id: id,
            productName: productName,
            imageName: imageName,
            price: price,
            stock: stock,
            createdDate: createdDate
        )));
        }
        
      },
      child: Card(
        elevation: 18.0,
        child: SizedBox(
          height: 28,
          width: MediaQuery.of(context).size.width/3,
          child: Column(
            children: [
              SizedBox(height: 5.0,),
              //Image(image: NetworkImage(imageName!),height: 80,),
              getProductImage(imageName, 80), //Netoworkimage
              //Image(image: NetworkImage("https://electronic-ecommerce.herokuapp.com/${imageName}",),height: 80.0 ,),
              SizedBox(height: 2.0,),
              Text("${productName}",style: TextStyle(fontSize: 16.0, color: Colors.black.withOpacity(0.6), fontWeight: FontWeight.w400),),
              SizedBox(height: 2.0,),

              RichText(
                text: TextSpan(
                  text: 'Nrs.',
                  style: TextStyle(fontSize: 15.0,color: Colors.red ),

                  children: [
                    TextSpan(
                      text: '${price}',
                      style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold, color: Colors.red),
                    )
                  ]
                )
              ),
              
              //Text("Rs.${provider.productList[index].price}", style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold),),
              SizedBox(height: 4.0,),

              Text("Created at: ${TimeStampConverter().getTimeStamp(createdDate)}",style: TextStyle(color: Colors.black.withOpacity(0.4)),),
              
              
              
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  stock != 0 ?SizedBox(
                    height: 24.0,
                    child: GestureDetector(
                      onTap: (){
                        // print(id.toString() );
                        // print(productName!);
                        // print(provider.productList[index].price!);
                        // print(imageName!);

                      Provider.of<Cart>(context,listen: false).addItem(id.toString() , productName , price, imageName);
                    }, 
                    child: Image(image: AssetImage("assets/images/cart0.png"),height: 24,),
                    )
                    ):SizedBox(),
                  
                  Padding(
                    padding: const EdgeInsets.only(top:5.0),
                    child: stock != 0? Container(
                      width: 21,
                      height: 21.0,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(14.0)
                      ),
                      
                      child:Center(child: Icon(Icons.check,color: Colors.white,size: 18.0,)),
                    ):Container(
                      width: MediaQuery.of(context).size.width/3,
                      height: 21.0,

                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(8.0)
                      ),
                      
                      child:Center(child: Text("Out of Stock",style:TextStyle(color:Colors.white, fontWeight: FontWeight.bold))),
                    ),
                  ),
                  
                ],
              )



            ],
          )
        ),
      ),
    );
  }
}