import 'package:flutter/material.dart';
import 'package:intern_task/controller/product.dart';
import 'package:intern_task/controller/unix_to_normal_time.dart';
import 'package:intern_task/view/widget/product_list.dart';
import 'package:provider/provider.dart';

import 'cart.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({ Key? key }) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();  
    Provider.of<ProductDetails>(context, listen: false).getProductDetails();
  }
  int _currentIndex = 0;
  final tabs =[
    ProductList(),CartScreen(), 
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[_currentIndex],
      //backgroundColor: Colors.blue,
      
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: Colors.red,
        //unselectedItemColor: Colors.white,
        onTap: (index){          
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
           BottomNavigationBarItem(
            icon: Icon(Icons.add_box,),
            label: "Product" ,
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: "Cart" ,
            backgroundColor: Colors.white,
          ),
         
        ],

      ),
    );
  }
}