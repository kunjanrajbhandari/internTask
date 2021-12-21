import 'package:flutter/material.dart';
import 'package:intern_task/controller/provider/product.dart';
import 'package:intern_task/controller/provider/cart_provider.dart';
import 'package:intern_task/view/main_drawer.dart';
import 'package:intern_task/view/products/products.dart';
import 'package:intern_task/view/single.dart';
import 'package:intern_task/view/widget/helper_widget_functions.dart';
import 'package:intern_task/view/products/select_category.dart';
import 'package:provider/provider.dart';

import 'category.dart';

class ProductList extends StatefulWidget {
  const ProductList({ Key? key }) : super(key: key);

  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {

  @override
  Widget build(BuildContext context) {
   // final items = Provider.of<String>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Main Screen")
      ),
      drawer: MainDrawer(),
      body: SingleChildScrollView(
        
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
           Consumer<ProductDetails>(
             builder: (context, provider, child){
              
               return provider.isLoading != true? Column(
                 mainAxisAlignment: MainAxisAlignment.end,
                 children: [
                   SizedBox(
                     height: MediaQuery.of(context).size.height/8.3 ,
                     width: MediaQuery.of(context).size.width,
                    // color: Colors.grey.withOpacity(.2),
                     child: Column(
                       mainAxisAlignment: MainAxisAlignment.end,
                       children: [
                         
                         Text("Category",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 19.0),),
                         SizedBox(
                            height: MediaQuery.of(context).size.height/11,
                            width: MediaQuery.of(context).size.width,
                           child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: provider.items.length,
                            
                            itemBuilder:(context, index){
                              return SelectCategory(categoryName: provider.items.values.toList()[index].categoryName);
                            }
                            ),
                         ),
                       ],
                     ),
                   ),
                   Text("Filter: ",style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold)),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          
                          GestureDetector(
                            onTap: (){
                              provider.recentProduct(true);
                            },
                            child: Container(
                              height: 20.0,
                              width:88.0,
                              decoration: BoxDecoration(
                                color: Colors.indigo,
                                borderRadius: BorderRadius.circular(16)
                              ),
                              child: Center(child: Text("Recent",style: TextStyle(color: Colors.white)))
                            )
                          ),
                          GestureDetector(
                            onTap: (){
                              provider.valueCompare(true);
                            },
                            child: Container(
                              height: 20.0,
                              width:88.0,
                              decoration: BoxDecoration(
                                color: Colors.indigo,
                                borderRadius: BorderRadius.circular(16)
                              ),
                              child: Center(child: Text("low to high",style: TextStyle(color: Colors.white)))
                            )
                          ),
                          GestureDetector(
                        onTap: (){
                          provider.valueCompare(false);
                        },
                        child: Container(
                          height: 20.0,
                          width:88.0,
                          decoration: BoxDecoration(
                          color: Colors.indigo,
                          borderRadius: BorderRadius.circular(16)
                          ),
                          child: Center(child: Text("high to low", style: TextStyle(color: Colors.white),)))
                      ),
                        ],
                      ),
                    ),
                    
                  
                  provider.itemss == 'electronic,All' || provider.itemss == ''? GridView.builder(
                      physics: const ScrollPhysics(),
                      addAutomaticKeepAlives: false,
                      scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, 
                          crossAxisSpacing: 11,mainAxisSpacing: 8
                        ),
                        itemCount: provider.productList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Products(id: provider.productList[index].id!, 
                            productName: provider.productList[index].productName!, 
                            imageName: provider.productList[index].imageName!, 
                            price: convertPrice(provider.productList[index].price!), 
                            stock: provider.productList[index].stock!, 
                            createdDate: provider.productList[index].date!
                          );
                        },
                   ):CategoryProduct(categoryName: provider.itemss),
                 ],
               ): Padding(
                 padding: const EdgeInsets.only(top:248.0),
                 child: Center(child: const CircularProgressIndicator()),
               );
             }
            ),
          ],
        ),
      ),
    );
  }
}