import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:intern_task/controller/provider/product.dart';
import 'package:intern_task/controller/unix_to_normal_time.dart';
import 'package:intern_task/view/checkout.dart';
import 'package:intern_task/view/login_signup/login.dart';
import 'package:intern_task/view/main_screen.dart';
import 'package:provider/provider.dart';

import 'controller/provider/cart_provider.dart';

void main()async {
   WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ProductDetails>(
          create: (BuildContext context) {
            return ProductDetails();
          },
        ),
        ChangeNotifierProvider<Cart>(
          create: (BuildContext context) {
            return Cart();
          },
        ),
        ChangeNotifierProvider<TimeStampConverter>(
          create: (BuildContext context) {
            return TimeStampConverter();
          },
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Login(),
      ),
    );
      
    
  }
}
    