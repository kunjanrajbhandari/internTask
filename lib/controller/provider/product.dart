import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intern_task/controller/assistant/request_assistant.dart';
import 'package:intern_task/model/product_model.dart';

class ProductDetails extends ChangeNotifier{
  List<ProductModel> productList = [];

  RequestAssistant requestAssistant = RequestAssistant();

  getProductDetails()async{
    String url = "https://electronic-ecommerce.herokuapp.com/api/v1/product";
    var res = await requestAssistant.getrequest(url);
    if(res == 'Failed'){
      Fluttertoast.showToast(msg: "cannot fetch this API", backgroundColor:  Colors.red, textColor: Colors.white);
    }
    else if(res["status"] == "success"){
      for (int i =0; i< res['data']['product'].length; i++){
        productList.add(ProductModel(
          id: res['data']['product'][i]['id'],
          productName: res['data']['product'][i]['name'],
          imageName: res['data']['product'][i]['image'],
          price: 5000.0,
          stock: res['data']['product'][i]['stock'],
          date: res['data']['product'][i]['createDate'],
          category: res['data']['product'][i]['category']
          ));
          
      }
      notifyListeners();
      return productList;
    }
    
  }
}