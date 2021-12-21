import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intern_task/controller/assistant/request_assistant.dart';
import 'package:intern_task/model/category.dart';
import 'package:intern_task/model/product_model.dart';
import 'package:provider/provider.dart';

class ProductDetails extends ChangeNotifier{
  List<ProductModel> productList = [];
  List<ProductModel> categoryProductList = [];
  Map<String, CategoryModel> _items = {};

  bool isLoading = false;
  
  Map<String, CategoryModel> get items {
    return {..._items};
  }
String itemss='';
  RequestAssistant requestAssistant = RequestAssistant();

  getProductDetails()async{
    isLoading =true; 
    String url = "https://electronic-ecommerce.herokuapp.com/api/v1/product";
    
    var res = await requestAssistant.getrequest(url);
    isLoading =false;
    _items['electronic,All']=CategoryModel(categoryName: "electronic,All");
    if(res == 'Failed'){
      Fluttertoast.showToast(msg: "cannot fetch this API", backgroundColor:  Colors.red, textColor: Colors.white);
    }
    else if(res["status"] == "success"){
      for (int i =0; i< res['data']['product'].length; i++){
        productList.add(ProductModel(
          id: res['data']['product'][i]['id'],
          productName: res['data']['product'][i]['name'],
          imageName: res['data']['product'][i]['image'],
          price: res['data']['product'][i]['price'],
          stock: res['data']['product'][i]['stock'],
          date: res['data']['product'][i]['createDate'],
          category: res['data']['product'][i]['category'].join(',')
          ));
          
           if(_items.containsKey(res['data']['product'][i]['category'].join(','))){
            
          }
          else{
            _items.putIfAbsent(res['data']['product'][i]['category'].join(','), () => CategoryModel(categoryName: res['data']['product'][i]['category'].join(',')));
          }
      }
      //productList.sort((a,b)=>a.price!.compareTo(b.price!));
      notifyListeners();
      return productList;
    }
    
  }
  // String get category{
  //   String category;
  //   return category;
  // }
  getcategory(String? categoryName){
    
    if(productList.isNotEmpty){
      categoryProductList = productList.where((data)=> data.category == categoryName).toList();
    }
  }
  recentProduct(bool recent){
    if(recent == true){
      productList.sort((a,b)=>a.date!.compareTo(b.date!));

      categoryProductList.sort((a,b)=>a.date!.compareTo(b.date!));
      notifyListeners();
      return productList;
    }
  }
  valueCompare(bool val){
    if(val == true){
      productList.sort((a,b)=>a.price!.compareTo(b.price!));

      categoryProductList.sort((a,b)=>a.price!.compareTo(b.price!));
      notifyListeners();
      return productList;
    }
    else{
      productList.sort((a,b)=>b.price!.compareTo(a.price!));

      categoryProductList.sort((a,b)=>b.price!.compareTo(a.price!));
      notifyListeners();
    return productList;
    }
    
  }
  getItem(String items){
    itemss = items;
    notifyListeners();
  }

  
  @override
  void dispose(){
    productList.clear();
    super.dispose();
  
  }
}