import 'package:flutter/material.dart';
import 'package:intern_task/controller/provider/cart_provider.dart';
import 'package:intern_task/view/checkout.dart';
import 'package:intern_task/view/widget/ptd.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart';

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Cart',),
      ),
      body:cart.items.isNotEmpty? Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: cart.items.length,
                itemBuilder: (context, i) => CartPdt(
                    cart.items.values.toList()[i].id,
                    cart.items.keys.toList()[i],
                    cart.items.values.toList()[i].price,
                    cart.items.values.toList()[i].quantity,
                    cart.items.values.toList()[i].name,
                    cart.items.values.toList()[i].imageName
                )
              )
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom:18.0),
                    child: RichText(
                    text: TextSpan(
                      text: 'Total: Rs.',
                      style: TextStyle(fontSize: 13.0,color: Colors.red ),

                      children: [
                        TextSpan(
                          text: '${cart.totalAmount}',
                          style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold, color: Colors.red),
                        )
                      ]
                    )
                ),
                  ),
                  CheckoutButton(cart: cart,),
                ],
              )
          
        ],
      ): Center(child: Text("Empty cart...",style: TextStyle(color: Colors.black.withOpacity(0.7)),)),
    );
  }
}

class CheckoutButton extends StatefulWidget {
  final Cart cart;

  const CheckoutButton({required this.cart});
  @override
  _CheckoutButtonState createState() => _CheckoutButtonState();
}

class _CheckoutButtonState extends State<CheckoutButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom:18.0),
      child: ElevatedButton(
        child: Text('Checkout'),
        onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const CheckOut()));
        },         
      ),
    );
  }
}