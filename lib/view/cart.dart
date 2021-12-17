import 'package:flutter/material.dart';
import 'package:intern_task/controller/provider/add_to_cart.dart';
import 'package:intern_task/view/widget/ptd.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart';

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Cart',
          
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
                itemCount: cart.items.length,
                itemBuilder: (ctx, i) => CartPdt(
                    cart.items.values.toList()[i].id,
                    cart.items.keys.toList()[i],
                    cart.items.values.toList()[i].price,
                    cart.items.values.toList()[i].quantity,
                    cart.items.values.toList()[i].name,
                    cart.items.values.toList()[i].imageName
                )
              ),
          ),
          CheckoutButton(
            cart: cart,
          ),
          // FlatButton(
          //     onPressed: () {
          //     },
          //     child: Text(
          //       'Checkout',
          //       style: TextStyle(color: Colors.blue, fontSize: 20),
          //     ))
        ],
      ),
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
    return ElevatedButton(
          
          child: Text('Checkout'),
          onPressed: (){},
          // onPressed:widget.cart.totalAmount <= 0
          //     ? null
          //     : () async {
          //         await Provider.of<Orders>(context, listen: false).addOrder(
          //             widget.cart.items.values.toList(), widget.cart.totalAmount);
          //         widget.cart.clear();
          //       },
       
    );
  }
}
