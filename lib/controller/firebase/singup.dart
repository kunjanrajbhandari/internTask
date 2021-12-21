import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intern_task/view/login_signup/login.dart';
import 'package:intern_task/view/widget/progress_dialog.dart';

class SingupRiderWithFirebase{
  String? password;
  String? rePassword;
  String? name;
  String? email;
  SingupRiderWithFirebase({required this.name, required this.email, required this.password, required this.rePassword});
  
  registerNewUser(BuildContext context)async{
    //creating instance collection of firebase firestore database ie. users and stored in variable db.
    var db = FirebaseFirestore.instance.collection("users");
    if(password == rePassword){
      try {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context){
            return ProgressDialog(
              message: 'Registering, Please wait....'
            );
          });
        //create user in firebase authentication if password and repassword is same
        UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email.toString(),
          password: password.toString()
        ).catchError((errMsg){
          Fluttertoast.showToast(msg:errMsg.toString(), backgroundColor:  Colors.red, textColor: Colors.white);
          //Get.snackbar("Error Msg", errMsg.toString());
        });
        User user = userCredential.user!;
        user.updateDisplayName(name);

        if(userCredential.user != null){  
          //storing the value of user in document of user_id ie.(doc(uid)) for the instance db created in 1st line of this function         
          db.doc(userCredential.user!.uid).set({
            'name': name,
            'email': email,
          });
          if(email!.isNotEmpty&& password!.isNotEmpty){
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Login()));
            
          }
          //Get.toNamed('/login');
          Fluttertoast.showToast(msg: "successfully created account", backgroundColor:  Colors.green, textColor: Colors.white);
          //Get.snackbar("title", "successfully created account");
        }     
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          return Fluttertoast.showToast(msg: "The password provided is too weak.", backgroundColor:  Colors.red, textColor: Colors.white);
          // Get.snackbar(
          //         'title', 
          //         "The password provided is too weak.", 
          //         snackPosition: SnackPosition.BOTTOM, 
          //         backgroundColor: Colors.red.withOpacity(0.7), 
          //         colorText: Colors.white
          //       );
        } else if (e.code == 'email-already-in-use') {
          return Fluttertoast.showToast(msg: "The account already exists for that email.", backgroundColor:  Colors.red, textColor: Colors.white);
          // Get.snackbar(
          //         'title', 
          //         "The account already exists for that email.", 
          //         snackPosition: SnackPosition.BOTTOM, 
          //         backgroundColor: Colors.red.withOpacity(0.7), 
          //         colorText: Colors.white
          //       );
         
        }
      } catch (e) {
        print(e);
      }
    }
    else{
      Navigator.pop(context);
      return Fluttertoast.showToast(msg: "incorrect password", backgroundColor:  Colors.red, textColor: Colors.white);
      //  Get.snackbar(
      //   'title', 
      //   "incorrect password", 
      //   snackPosition: SnackPosition.BOTTOM, 
      //   backgroundColor: Colors.red.withOpacity(0.7), 
      //   colorText: Colors.white
      // );
    }
  }

}