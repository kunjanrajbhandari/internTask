import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intern_task/controller/provider/product.dart';
import 'package:intern_task/view/splash.dart';
import 'package:provider/provider.dart';

class MainDrawer extends StatefulWidget {
  const MainDrawer({ Key? key }) : super(key: key);

  @override
  State<MainDrawer> createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
final email = FirebaseAuth.instance.currentUser!.email;
  final name = FirebaseAuth.instance.currentUser!.displayName;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
            color: Theme.of(context).primaryColor,
            child: Center(
              child: Column(
                children: [ 
                  Container(
                    height: 100.0,
                    width: 100.0,
                    margin: EdgeInsets.only(top: 50,bottom: 20),
                    decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(image: NetworkImage('https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_640.png'),fit: BoxFit.fill)
                  ),
                  ),
                  Text("$name", style: TextStyle(fontSize: 22.0,color: Colors.white),),
                  Text("$email", style: TextStyle(color: Colors.white),)
                ],
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text("Logout"),
            onTap: (){
              // ProductDetails details;
              // details = Provider.of<ProductDetails>(context,listen: false);
              // @override
              // void dispose(){
              //   details.dispose();
              //   super.dispose();
              // }
              FirebaseAuth.instance.signOut();   
              
              Fluttertoast.showToast(msg: "Sucessfully loggout", backgroundColor:  Colors.green, textColor: Colors.white);   
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) =>  SplashScreen()));   
            },
          )
        ],
      ),
      
    );
  }
}