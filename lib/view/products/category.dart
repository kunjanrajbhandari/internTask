import 'package:flutter/material.dart';
import 'package:intern_task/controller/provider/product.dart';
import 'package:intern_task/view/products/products.dart';
import 'package:intern_task/view/widget/helper_widget_functions.dart';
import 'package:provider/provider.dart';

class CategoryProduct extends StatefulWidget {
  String categoryName;
   CategoryProduct({ Key? key ,required this.categoryName}) : super(key: key);

  @override
  _CategoryProductState createState() => _CategoryProductState();
}

class _CategoryProductState extends State<CategoryProduct> {
 
  @override
  Widget build(BuildContext context) {
    return Consumer<ProductDetails>(
      builder: (context, provider,child){
        return GridView.builder(
        physics: const ScrollPhysics(),
        addAutomaticKeepAlives: false,
        scrollDirection: Axis.vertical,
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, 
            crossAxisSpacing: 11,mainAxisSpacing: 8
          ),
          itemCount: provider.categoryProductList.length,
          itemBuilder: (BuildContext context, int index) {
            return Products(
              id: provider.categoryProductList[index].id!, 
              productName: provider.categoryProductList[index].productName!, 
              imageName: provider.categoryProductList[index].imageName!, 
              price: convertPrice(provider.categoryProductList[index].price!), 
              stock: provider.categoryProductList[index].stock!, 
              createdDate: provider.categoryProductList[index].date!
            );
          },
      );
      },
    );
  }
}