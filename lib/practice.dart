import 'package:flutter/material.dart';
import 'package:intern_task/provider.dart';
import 'package:provider/provider.dart';

class Practive extends StatefulWidget {
  const Practive({ Key? key }) : super(key: key);

  @override
  _PractiveState createState() => _PractiveState();
}

class _PractiveState extends State<Practive> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ChangeNotifierProvider<ProviderClass>(
            create: (context)=> ProviderClass(),
            child: Consumer<ProviderClass>(
              builder: (context, provider, child){
                return Column(
                  children: [
                    Text("${provider.message}", style: TextStyle(color: provider.iseligible == true ? Colors.green: Colors.red),),
                    TextFormField(    
                      decoration: const InputDecoration(  
                      labelText: 'Age',  
                      labelStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 15.0,
                      ),
                      
                    ), 
                    onChanged: (val){
                      if(val.isNotEmpty){
                        provider.checkEligibility(int.parse(val));
                      }
                      
                    }, 
                    ),
                  ],
                );
              },
            ),
          ),
          
        ],
      )
    );
  }
}