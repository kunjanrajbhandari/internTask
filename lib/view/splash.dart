import 'package:flutter/material.dart';
import 'package:intern_task/controller/firebase/splash.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({ Key? key }) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {
 UserSplash splash = UserSplash();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splash.authenticatedUser(context);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.orange[200],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(child: Image(image: AssetImage('assets/images/logo.png'))),
          Center(
            child: Padding(
              padding: EdgeInsets.only(top:45.0),
                  child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const[
                    Text('Loading Please wait...', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),), 
                    SizedBox(height: 16.0,),
                    CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.black),),
                    
                  ],
                )
              
            ),
          )
        ],
      ),
      
    );
  }
}