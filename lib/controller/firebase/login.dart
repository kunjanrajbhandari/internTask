import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intern_task/view/main_screen.dart';
import 'package:intern_task/view/widget/progress_dialog.dart';

class LoginRiderWithFirebase {
  String? password;
  String? email;
  LoginRiderWithFirebase({required this.email, required this.password});
  
  loginUser(BuildContext context)async{
    
      try {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context){
            return ProgressDialog(
              message: 'Authenticating, Please wait....'
            );
          });
        //signin if login or password is match
        UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email.toString(),
          password: password.toString()
        ).catchError((errMsg){
          Navigator.pop(context);
          Fluttertoast.showToast(msg: errMsg.toString(), backgroundColor:  Colors.red, textColor: Colors.white);
        });

        //checking user is null or not 
        if(userCredential.user != null){    
          //checking user firebase firestore database value is null or not.
             
          FirebaseFirestore.instance.collection("users").doc(userCredential.user!.uid).get().then((value) {
            //applying condition that user value in firestore database is not null
            if(value.data() != null){
              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => const MainScreen()),(Route<dynamic> route) => false,);
              
              Fluttertoast.showToast(msg: "successfully logged-in now", backgroundColor:  Colors.green, textColor: Colors.white);
           }
           else{
             Navigator.pop(context);
              FirebaseAuth.instance.signOut();   
              Fluttertoast.showToast(msg: "No Record Exist For This User", backgroundColor:  Colors.green, textColor: Colors.white);           
            }
          }
           
          );
        }  
        else{
          Navigator.pop(context);
          Fluttertoast.showToast(msg: "Could not be Signed-in", backgroundColor:  Colors.green, textColor: Colors.white);           
          
        }   
      } 
       catch (e) {
        print(e);
      }
  }

}