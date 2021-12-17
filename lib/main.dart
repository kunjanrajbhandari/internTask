import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:intern_task/controller/product.dart';
import 'package:intern_task/view/main_screen.dart';
import 'package:provider/provider.dart';

import 'controller/provider/add_to_cart.dart';

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
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MainScreen(),
      ),
    );
      
    
  }
}
    