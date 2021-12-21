import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intern_task/view/main_screen.dart';
import 'package:intern_task/view/splash.dart';
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
         Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => const SplashScreen()),(Route<dynamic> route) => false,);
          
      } 
       catch (e) {
        print(e);
      }
  }

}