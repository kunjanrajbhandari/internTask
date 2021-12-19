
import 'package:flutter/material.dart';
import 'package:intern_task/controller/provider/product.dart';
import 'package:intern_task/controller/provider/cart_provider.dart';
import 'package:intern_task/view/single.dart';
import 'package:intern_task/view/widget/helper_widget_functions.dart';
import 'package:provider/provider.dart';

class ProductList extends StatefulWidget {
  const ProductList({ Key? key }) : super(key: key);

  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child:  Column(
        children: [
         Consumer<ProductDetails>(
           builder: (context, provider, child){
             return GridView.builder(
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
                    return GestureDetector(
                      onTap: (){
                        if(provider.productList[index].stock != 0){

                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => SinglePage(id: provider.productList[index].id,
                          productName: provider.productList[index].productName,
                          imageName: provider.productList[index].imageName,
                          price: convertPrice(provider.productList[index].price!),
                          stock: provider.productList[index].stock,
                          createdDate: provider.productList[index].date
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
                              //Image(image: NetworkImage(provider.productList[index].imageName!),height: 80,),
                              getProductImage(provider.productList[index].imageName, 80), //Netoworkimage
                              //Image(image: NetworkImage("https://electronic-ecommerce.herokuapp.com/${provider.productList[index].imageName}",),height: 80.0 ,),
                              SizedBox(height: 2.0,),
                              Text("${provider.productList[index].productName}",style: TextStyle(fontSize: 16.0, color: Colors.black.withOpacity(0.6), fontWeight: FontWeight.w400),),
                              SizedBox(height: 2.0,),

                              RichText(
                                text: TextSpan(
                                  text: 'Nrs.',
                                  style: TextStyle(fontSize: 15.0,color: Colors.red ),

                                  children: [
                                    TextSpan(
                                      text: '${convertPrice(provider.productList[index].price!)}',
                                      style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold, color: Colors.red),
                                    )
                                  ]
                                )
                              ),
                              
                              //Text("Rs.${provider.productList[index].price}", style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold),),
                              SizedBox(height: 4.0,),
                              Text("${provider.productList[index].stock} Pieces",style: TextStyle(fontWeight: FontWeight.bold),),
                              
                              
                              
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  provider.productList[index].stock != 0 ?SizedBox(
                                    height: 24.0,
                                    child: GestureDetector(
                                      onTap: (){
                                        print(provider.productList[index].id.toString() );
                                        print(provider.productList[index].productName!);
                                        print(provider.productList[index].price!);
                                        print(provider.productList[index].imageName!);

                                      Provider.of<Cart>(context,listen: false).addItem(provider.productList[index].id.toString() , provider.productList[index].productName! , convertPrice(provider.productList[index].price!), provider.productList[index].imageName! );
                                    }, 
                                    child: Image(image: AssetImage("assets/images/cart0.png"),height: 24,),
                                    )
                                    ):SizedBox(),
                                  
                                  Padding(
                                    padding: const EdgeInsets.only(top:5.0),
                                    child: provider.productList[index].stock != 0? Container(
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
                  },
             );
           }
          ),
        ],
      ),
    );
  }
}