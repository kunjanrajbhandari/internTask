import 'package:flutter/cupertino.dart';

class AddToCart extends ChangeNotifier{
  bool isAddToCart=false;

  checkAddToCart()async{
    if(isAddToCart == false){
      isAddToCart = true;
      notifyListeners();
    }
    else{
      isAddToCart = false;
      notifyListeners();
    }
  }

}