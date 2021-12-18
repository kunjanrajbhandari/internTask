import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Checkout{
var db = FirebaseFirestore.instance.collection("checkout");
  final FirebaseAuth auth = FirebaseAuth.instance;

  void sendData(String name, String phoneNumber, String billingAddress, String deliveryAddress, DateTime date) {
    final User user;
    user = auth.currentUser!;
    final uid = user.uid;
    print(uid);


    db.doc(uid).set({
      'name': name,
      'phone number': phoneNumber,
      'billing address': billingAddress,
      'delivery address': deliveryAddress,
      'date': date,
      
    });
    Fluttertoast.showToast(msg:"sucessfully ordered", backgroundColor:  Colors.green, textColor: Colors.white);
  }
}