import 'package:flutter/material.dart';

class ProgressDialog extends StatelessWidget {
  String? message;
   ProgressDialog({required this.message, Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.yellow,
      child: Container(
        margin: EdgeInsets.all(15.0),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(11.0)
        ),
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Row(
            children: [
              SizedBox(width: 6.0,),
              CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.black),),
              SizedBox(width: 6.0,),
              Text('$message', style: TextStyle(color: Colors.black, fontSize: 14.0),)
            ],
          ),
        ),
      ),
      
    );
  }
}