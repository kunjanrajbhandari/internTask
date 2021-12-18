import 'package:flutter/material.dart';
import 'package:intern_task/controller/provider/cart_provider.dart';
import 'package:intern_task/view/widget/helper_widget_functions.dart';
import 'package:provider/provider.dart';

class CartPdt extends StatelessWidget {
  final String id;
  final String productId;
  final double price;
  final int quantity;
  final String name;
  final String imageName;
  CartPdt(this.id, this.productId, this.price, this.quantity, this.name, this.imageName);
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(id),
      direction: DismissDirection.endToStart,
      background: Container(
        color: Colors.red.withOpacity(0.7),
      ),
      onDismissed: (direction) {
        Provider.of<Cart>(context, listen: false).removeItem(productId);
      },
      child: Card(
        child: SizedBox(
          height: 77,
          child: Padding(
            padding: const EdgeInsets.only(left:8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                        child: FittedBox(child: getProductImage(imageName,50),
                      fit: BoxFit.fitWidth),),
                      Text(name,style:TextStyle(fontSize: 17.0, fontWeight: FontWeight.w500),),
                      SizedBox(
                        width: 130.0,
                        child:Row(
                          children: [
                            IconButton(onPressed: (){
                              Provider.of<Cart>(context,listen: false).addItem(productId, name, 20, imageName);
                            }, 
                            icon: Icon(Icons.add),iconSize: 19.0,),
                            Text('$quantity ',style: TextStyle(fontSize: 19.0,fontWeight: FontWeight.bold),),

                            IconButton(onPressed: (){
                              Provider.of<Cart>(context,listen: false).removeSingleItem(productId);
                            }, icon: Icon(Icons.remove),iconSize: 19.0,),
                          ],
                        )
                      ) 
                  ],
                ),
                SizedBox(height: 4.0,),
                RichText(
                  text: TextSpan(
                    text: 'Total: Rs.',
                    style: TextStyle(fontSize: 13.0,color: Colors.red ),

                    children: [
                      TextSpan(
                        text: '${(price * quantity)}',
                        style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold, color: Colors.red),
                      )
                    ]
                  )
                ),
                              
                //Text('Total: \$${(price * quantity)}',style: TextStyle(fontWeight: FontWeight.bold),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
