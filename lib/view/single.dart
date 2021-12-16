
import 'package:flutter/material.dart';
import 'package:intern_task/controller/provider/add_to_cart.dart';
import 'package:intern_task/controller/unix_to_normal_time.dart';
import 'package:intern_task/view/widget/custom_appbar.dart';
import 'package:intern_task/view/widget/helper_widget_functions.dart';
import 'package:provider/provider.dart';

class SinglePage extends StatefulWidget {
  int? id;
  String? productName;
  int? stock;
  String? imageName;
  String? price;
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
          CustomAppBar(),
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
                child: Padding(
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
                      )
                      //
                      //Text("${widget.productName}", style: TextStyle(fontSize: 18.9, fontWeight: FontWeight.bold, color: Colors.black.withOpacity(0.9) ),),
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