import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:intern_task/view/login_signup/login.dart';
import 'package:intern_task/view/main_screen.dart';

void main()async {
   WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
      ),
      home: const Login(),
    );
  }
}
