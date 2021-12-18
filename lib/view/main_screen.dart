import 'package:flutter/material.dart';
import 'package:intern_task/controller/firebase/checkout.dart';
import 'package:intern_task/controller/provider/product.dart';
import 'package:intern_task/view/widget/cart_logo.dart';
import 'package:intern_task/view/widget/product_list.dart';
import 'package:provider/provider.dart';
import 'cart.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({ Key? key }) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
Checkout checkout = Checkout();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();  

    Provider.of<ProductDetails>(context, listen: false).getProductDetails();
    //checkout.inputData();
  }
  int _currentIndex = 0;
  final tabs =[
    const ProductList(), CartScreen(), 
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[_currentIndex],
      //backgroundColor: Colors.blue,
      
      bottomNavigationBar: BottomNavigationBar(

        unselectedItemColor: Colors.black,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.w500, fontSize: 16.0 ),
        showUnselectedLabels: true,

        selectedFontSize: 20,
        selectedItemColor: Colors.red,

        currentIndex: _currentIndex,

        onTap: (index){          
          setState(() {
            _currentIndex = index;
          });
        },
        items:  [
           BottomNavigationBarItem(
            icon: Image(image: AssetImage('assets/images/product-design.png'),height: 30.0,),
            label: "Product" ,
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: CartLogo(),
            label: "Cart" ,
            backgroundColor: Colors.white,
          ),
         
        ],

      ),
    );
  }
}