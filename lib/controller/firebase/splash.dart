import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intern_task/controller/provider/product.dart';
import 'package:intern_task/view/login_signup/login.dart';
import 'package:intern_task/view/main_screen.dart';
import 'package:provider/provider.dart';

class UserSplash{
  final FirebaseAuth auth = FirebaseAuth.instance;
  
  authenticatedUser(BuildContext context){
    final User user;

  if( auth.currentUser != null){//goes if user id is availiable
     user = auth.currentUser!;

    final uid = user.uid;
      
     FirebaseFirestore.instance.collection("users").doc(uid).get().then((value) {
      //applying condition that user value in firestore database is not null
      if(value.data() != null){
        print(uid);
        Fluttertoast.showToast(msg: "successfully logged-in now", backgroundColor:  Colors.green, textColor: Colors.white);
        
        if(Provider.of<ProductDetails>(context, listen: false).productList.isEmpty){
          Provider.of<ProductDetails>(context, listen: false).getProductDetails();
        }  
              
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) =>  MainScreen()));
      }
      else{
        Navigator.pop(context);
        FirebaseAuth.instance.signOut();   
        Fluttertoast.showToast(msg: "No Record Exist For This User", backgroundColor:  Colors.green, textColor: Colors.white);   
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) =>  Login()));        
      }
     });
  }// goes if user id is not availiable eg.. after logout 
  else{
    SchedulerBinding.instance?.addPostFrameCallback((_) {
      Navigator.push(context,MaterialPageRoute(builder: (context) => const Login()));
    });
  }
   
  }
   
}