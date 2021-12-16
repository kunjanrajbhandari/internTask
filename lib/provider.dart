import 'package:flutter/cupertino.dart';

class ProviderClass extends ChangeNotifier{
  bool? iseligible;
  String message="";

  checkEligibility(int age){
    if(age >= 18){
      iseligible = true;
      message = "You are eligible";
      notifyListeners();
    }
   
    else if(age<=18){
      iseligible = false;
      message = "You are not eligible";
      notifyListeners();
    }
     
  }
  isemptyage(int? age){
     
      iseligible = false;
      message = "empty value";
      notifyListeners();
    
  }
}