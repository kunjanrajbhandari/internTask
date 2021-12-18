import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DummyData extends StatelessWidget {
  const DummyData({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Text("Delivery",style: TextStyle(fontSize: 17.0,color: Colors.black.withOpacity(0.4) )),
          Padding(
            padding: const EdgeInsets.only(right:58.0, bottom: 18),
            child: Text("Home Deliveery 3-6 Days",style: TextStyle(fontSize: 15.0,color: Colors.black )),
          ),
        ],),
        Divider(),
        Padding(padding: EdgeInsets.only(top:18.0)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Services",style: TextStyle(fontSize: 17.0,color: Colors.black.withOpacity(0.4) )),
            RichText(
              text: TextSpan(
                text: '* 7 Days Returns\n',
                style: TextStyle(fontSize: 15.0,color: Colors.black ),

                children: [
                  
                  TextSpan(
                    text: '  Change of mind is not applicable\n',
                    style: TextStyle(fontSize: 15.0,  color: Colors.black.withOpacity(0.4)),
                  ),
                  TextSpan(
                    text: '* Warranty not availiable\n',
                    style: TextStyle(fontSize: 15.0, color: Colors.black),
                  )
                ]
              )
            ),
          ],
        ),
      ],
    );
  }
}