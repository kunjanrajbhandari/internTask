import 'package:flutter/material.dart';
import 'package:intern_task/controller/product.dart';
import 'package:intern_task/controller/unix_to_normal_time.dart';
import 'package:intern_task/view/widget/product_list.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({ Key? key }) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  TimeStampConverter times = TimeStampConverter();
  ProductDetails productDetails = ProductDetails();
  //final productDetails =Provider.of<ProductDetails>(context).getProductDetails();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    productDetails.getProductDetails();
    setState(() {
      
    });
    print(times.getTimeStamp(1639575285192));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.blue,
      
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
       child: Padding(
         padding: const EdgeInsets.only(left:8.0, right: 8.0),
         child: RefreshIndicator(
           onRefresh: ()=>  productDetails.getProductDetails(),
           child: ProductList()
         ),
       ),
      ),
    );
  }
}