import 'package:flutter/material.dart';
import 'package:intern_task/controller/firebase/singup.dart';
import 'package:intern_task/view/login_signup/login.dart';

class Signup extends StatefulWidget {
  const Signup({ Key? key }) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _name = TextEditingController();
  final _email = TextEditingController();
  final _phoneNumber = TextEditingController();
  final _password = TextEditingController();
  final _rePassword = TextEditingController();
  final _loginFormKey = GlobalKey<FormState>();  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            
             const Image(
              height: 350.0,
              width: 350.0,
              image: AssetImage(
                'assets/images/logo.png'
              )
            ),
            const SizedBox(height: 1.0,),
            const Text("Register as a Rider",
             style: TextStyle(
               fontSize: 24,
               fontFamily: "Brand Bold"
            ),),
             const SizedBox(height: 1.0,),
      
             Form(
               key: _loginFormKey,
               child: Padding(
                 padding: const EdgeInsets.all(18.0),
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.end,
                   children: [
                     Padding(
                       padding: const EdgeInsets.only(top:11.0),
                       child: TextFormField(
                         controller: _name,
                         keyboardType: TextInputType.emailAddress,
                         decoration: const InputDecoration(    
                          labelText: 'Full Name',  
                          labelStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 15.0,
                          )
                        ),  
                       ),
                     ),
                     Padding(
                       padding: const EdgeInsets.only(top:18.0),
                       child: TextFormField(
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
                     ),
                     
                    
                     Padding(
                       padding: const EdgeInsets.only(top:18.0),
                       child: TextFormField(
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
                     ),
                     Padding(
                       padding: const EdgeInsets.only(top:18.0),
                       child: TextFormField(
                         controller: _rePassword,
                         obscureText: true,
                         decoration: const InputDecoration(  
                          labelText: 'Re-password',  
                          labelStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 15.0,
                          )
                        ),  
                       ),
                     ),
                     const SizedBox(height: 15.0,),
      
                     GestureDetector(
                       onTap: (){
                         //Get.toNamed('/login');
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Login()));
                       },
                       child: RichText(
                         text: TextSpan(
                           text: "Already have a acount? ", style: TextStyle(color: Colors.black, fontFamily: "Brand Bold"),
                           children: [
                             TextSpan(
                               text: "Log in", style: TextStyle(color: Colors.blue, fontStyle: FontStyle.italic)
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
                             fontFamily: 'Brand Bold', 
                           )
                         ),
                         onPressed: (){
                           SingupRiderWithFirebase signup = SingupRiderWithFirebase(name: _name.text, email:_email.text, 
                            password: _password.text, rePassword: _rePassword.text);
                           signup.registerNewUser(context);
                           
                         }, 
                         child: Container(
                           height: 22.0,
                           width: MediaQuery.of(context).size.width/2,
                           child: Center(
                             child: Text(
                               "Create Account", 
                               style: TextStyle(fontFamily: "Brand Bold"),
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