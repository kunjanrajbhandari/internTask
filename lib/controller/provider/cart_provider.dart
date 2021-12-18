import 'package:flutter/foundation.dart';
import 'package:intern_task/model/cart_model.dart';


class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

  int get itemCount {
    return _items.length;
  }

  void addItem(String pdtid, String name, double price, String imageName) {
    if (_items.containsKey(pdtid)) {
      _items.update(
          pdtid,
          (existingCartItem) => CartItem(
              id: DateTime.now().toString(),
              name: existingCartItem.name,
              quantity: existingCartItem.quantity + 1,
              price: existingCartItem.price,
              imageName: imageName
          )
      );
    } 
    else {
      _items.putIfAbsent(
          pdtid,
          () => CartItem(
                name: name,
                id: DateTime.now().toString(),
                quantity: 1,
                price: price,
                imageName: imageName
              ));
    }
    notifyListeners();
  }

  void removeItem(String id) {
    _items.remove(id);
    
    notifyListeners();
  }

  void removeSingleItem(String id) {
    if (!_items.containsKey(id)) {
      return;
    }
    if (_items[id]!.quantity > 1) {
      _items.update(
          id,
          (existingCartItem) => CartItem(
              id: DateTime.now().toString(),
              name: existingCartItem.name,
              quantity: existingCartItem.quantity - 1,
              price: existingCartItem.price,
              imageName: existingCartItem.imageName
              ));
    }
    notifyListeners();
  }

  double get totalAmount {
    double total = 0;
    _items.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quantity;
    });
    
    return total;
  }
  int get totalCartCount {
    int totalCount = 0;
    _items.forEach((key, cartItem) {
      totalCount += cartItem.quantity ;
    });
    return totalCount;
  }



 
  // void clear() {
  //   _items = {};
  //   notifyListeners();
  // }
}
