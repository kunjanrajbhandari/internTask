import 'package:flutter/material.dart';
import 'package:intern_task/controller/firebase/login.dart';
import 'package:intern_task/view/login_signup/signup.dart';

class Login extends StatefulWidget {
  const Login({ Key? key }) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _loginFormKey = GlobalKey<FormState>();  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 35.0,),
             Center(
               child: Image(
                height: 350.0,
                width: 350.0,
                image: AssetImage(
                  'assets/images/logo.png'
                )
            ),
             ),
            SizedBox(height: 1.0,),
            Padding(
              padding: const EdgeInsets.only(top:6.0,left: 18.0, bottom: 6.0),
              child: Text("Hey There,\nWellcome Back",
               style: TextStyle(
                 fontSize: 24,
                 fontWeight: FontWeight.w600
              ),),
            ),
             
             SizedBox(height: 1.0,),
      
             Form(
               key: _loginFormKey,
               child: Padding(
                 padding: const EdgeInsets.all(18.0),
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.end,
                   children: [
                     TextFormField(
                       controller: _email,
                       keyboardType: TextInputType.emailAddress,
                       decoration: const InputDecoration(    
                        labelText: 'Email',  
                        labelStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 15.0,
                        )
                      ),  
                     ),
                     SizedBox(height: 8.0,),
                     TextFormField(
                       controller: _password,
                       obscureText: true,
                       decoration: const InputDecoration(  
                        labelText: 'Password',  
                        labelStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 15.0,
                        )
                      ),  
                     ),
                     SizedBox(height: 15.0,),
      
                     GestureDetector(
                       onTap: (){
                         Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Signup()));
                         
                       },
                       child: RichText(
                         text: TextSpan(
                           text: "Don't have an account? ", style: TextStyle(color: Colors.black, fontFamily: "Brand Bold"),
                           children: [
                             TextSpan(
                               text: "Sign up",style: TextStyle(color: Colors.blue, fontStyle: FontStyle.italic)
                             )
                           ]
                         ),
                         ),
                     ),
      
                     SizedBox(height: 15.0,),
                     Center(
                       child: ElevatedButton(
                         style: ElevatedButton.styleFrom(                       
                           primary: Colors.orange,
                           padding: EdgeInsets.all(15),
                           textStyle: TextStyle(
                             fontSize:18.0, 
                           )
                         ),
                         onPressed: (){
                           LoginRiderWithFirebase login = LoginRiderWithFirebase(email: _email.text, password: _password.text);
                           login.loginUser(context);
                         }, 
                         child: Container(
                           height: 22.0,
                           width: 99.0,
                           child: Center(
                             child: Text(
                               "Login", 
                              ),
                           ),
                         )
                        ),
                     )
                   ],
                 ),
               )
               
               )
          ],
        ),
      )
    );
  }
}