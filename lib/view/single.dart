
import 'package:flutter/material.dart';
import 'package:intern_task/controller/provider/cart_provider.dart';
import 'package:intern_task/controller/unix_to_normal_time.dart';
import 'package:intern_task/view/widget/custom_appbar.dart';
import 'package:intern_task/view/widget/dummy_data.dart';
import 'package:intern_task/view/widget/helper_widget_functions.dart';
import 'package:provider/provider.dart';

class SinglePage extends StatefulWidget {
  int? id;
  String? productName;
  int? stock;
  String? imageName;
  double? price;
  int? createdDate;

   SinglePage({ Key? key, required this.id,required this.imageName, required this.stock, required this.price, required this.productName, required this.createdDate}) : super(key: key);

  @override
  _SinglePageState createState() => _SinglePageState();
}

class _SinglePageState extends State<SinglePage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.orange,
      //   title: Text("${widget.productName}"),
      // ),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          const CustomAppBar(),
          Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height/2,
                width: MediaQuery.of(context).size.width,
                //color: Colors.black.withOpacity(0.09),
                child: Center(child: getProductImage(widget.imageName, 200)),
              ),
              
              
              Container(
                color: Colors.black.withOpacity(0.1),
                height: MediaQuery.of(context).size.height/2,
                child: SingleChildScrollView(
                  child:  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("US ${widget.price}", style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500, color: Color(0xffF28400)),),
                            SizedBox(height: 24.0,),
                            Text("${widget.productName}", style: TextStyle(color: Colors.black, fontSize: 18.0, fontWeight: FontWeight.w400),),
                            SizedBox(height: 22.0,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                
                                Container(
                                  height: 30.0,
                                  width: 111.0,
                                  decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(22.0)
                                  ),
                                  child: Center(child: Text("Availiable", style: TextStyle(color: Colors.white, ),)),
                                ),
                                Text("Created at: ${TimeStampConverter().getTimeStamp(widget.createdDate)}", style: TextStyle(color: Colors.black.withOpacity(0.6)),),
                              ],
                            ),
                            Divider(),
                            Padding(
                              padding: const EdgeInsets.only(top:18.0),
                              child: DummyData(),
                            ),
                            
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.orange,
                                padding: EdgeInsets.all(15),
                                ),
                                onPressed: (){}, child: Container(width:99.0,height: 22,child: Center(child: Text("Buy Now", style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),)))
                              ),
                              SizedBox(width: 28.0,),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.red,
                                padding: EdgeInsets.all(15),
                                ),
                                onPressed: (){
                                Provider.of<Cart>(context,listen: false).addItem(widget.id!.toString(), widget.productName!, widget.price!, widget.imageName!);
                                }
                                , child: Text("Add to card", style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),)
                              )
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              
            ],
          ),
          
        ],
      ),
    );
  }
}