
import 'package:flutter/material.dart';
import 'package:intern_task/controller/product.dart';
import 'package:intern_task/controller/unix_to_normal_time.dart';
import 'package:intern_task/view/single.dart';
import 'package:intern_task/view/widget/helper_widget_functions.dart';
import 'package:provider/provider.dart';

class ProductList extends StatefulWidget {
  const ProductList({ Key? key }) : super(key: key);

  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  TimeStampConverter times = TimeStampConverter();
  ProductDetails productDetails = ProductDetails();
  //final productDetails =Provider.of<ProductDetails>(context).getProductDetails();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  
    productDetails.getProductDetails();
    Provider.of<ProductDetails>(context, listen: false).getProductDetails();
    print(times.getTimeStamp(1639575285192));

  
  }



  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
       Consumer<ProductDetails>(
         builder: (context, provider, child){
           return GridView.builder(
              physics: ScrollPhysics(),
              addAutomaticKeepAlives: false,
              scrollDirection: Axis.vertical,
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  
                  crossAxisCount: 2, 
                  crossAxisSpacing: 11,mainAxisSpacing: 8
                ),
                itemCount: provider.productList.length,
                itemBuilder: (BuildContext context, int index) {

                  return GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => SinglePage(id: provider.productList[index].id,
                        productName: provider.productList[index].productName,
                        imageName: provider.productList[index].imageName,
                        price: provider.productList[index].price,
                        stock: provider.productList[index].stock,
                        createdDate: provider.productList[index].date

                      )));
                      
                    },
                    child: Card(
                      
                      elevation: 18.0,
                      child: SizedBox(
                        height: 220.0,
                        width: MediaQuery.of(context).size.width/3,
                        
                        
                        child: Column(
                          children: [
                            SizedBox(height: 5.0,),
                            getProductImage(provider.productList[index].imageName, 80),
                            //Image(image: NetworkImage("https://electronic-ecommerce.herokuapp.com/${provider.productList[index].imageName}",),height: 80.0 ,),
                            SizedBox(height: 2.0,),
                            Text("${provider.productList[index].productName}",style: TextStyle(fontSize: 16.0, color: Colors.black.withOpacity(0.6), fontWeight: FontWeight.w400),),
                            SizedBox(height: 2.0,),
                            Text("US ${provider.productList[index].price}", style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold),),
                            SizedBox(height: 4.0,),
                            Text("${provider.productList[index].stock} Pieces",style: TextStyle(fontWeight: FontWeight.bold),),
                            Container(
                              width: MediaQuery.of(context).size.width/3-18,
                              height: 19.0,
                              decoration: BoxDecoration(
                                color: provider.productList[index].stock != 0? Colors.green:Colors.orange,
                                borderRadius: BorderRadius.circular(4.0)
                              ),
                              
                              child:provider.productList[index].stock != 0? Center(child: Text("Availiable",style: TextStyle(color: Colors.white,),)):Text("Out of Stock"),
                            )
                          ],
                        )),
                    ),
                  );
         },
           );
         }
        ),
        // GridView.builder(
        //       physics: ScrollPhysics(),
        //       addAutomaticKeepAlives: false,
        //       scrollDirection: Axis.vertical,
        //         shrinkWrap: true,
        //         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  
        //           crossAxisCount: 2, 
        //           crossAxisSpacing: 11,mainAxisSpacing: 8
        //         ),
        //         itemCount: productDetails.productList.length,
        //         itemBuilder: (BuildContext context, int index) {

        //           return 
        //         },
                  
                
        //       ),
      ],
    );
  }
}