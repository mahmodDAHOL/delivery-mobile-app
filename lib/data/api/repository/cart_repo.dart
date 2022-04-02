import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/models/cart_model.dart';
import 'package:untitled/utils/app_constants.dart';

class CartRepo extends GetxService {
  final SharedPreferences sharedPreferences;
  CartRepo({required this.sharedPreferences});
  List<String> cart = [];
  List<String> cartHistory = [];
  void addToCartList(List<CartModel> cartList) {
    cart = [];
    // convert object to string because shared preferences only accept string
    cartList.forEach((element) => cart.add(jsonEncode(element)));

    sharedPreferences.setStringList(AppConstants.CART_LIST, cart);
  }

  List<CartModel> getCartList() {
    List<String> carts = [];
    if (sharedPreferences.containsKey(AppConstants.CART_LIST)) {
      carts = sharedPreferences.getStringList(AppConstants.CART_LIST)!;
    }

    List<CartModel> cartList = [];
    carts.forEach(
        (element) => cartList.add(CartModel.fromJson(jsonDecode(element))));
    return cartList;
  }

  List<CartModel> getCartHistoryList() {
    if (sharedPreferences.containsKey("cart-history-list")) {
      cartHistory = [];
      cartHistory = sharedPreferences.getStringList("cart-history-list")!;
    }
    List<CartModel> cartListHistory = [];
    cartHistory.forEach((element) =>
        cartListHistory.add(CartModel.fromJson(jsonDecode(element))));

    return cartListHistory;
  }

  void addToCartHistoryList() {
    if (sharedPreferences.containsKey("cart-history-list")) {
      cartHistory = sharedPreferences.getStringList("cart-history-list")!;
    }
    for (int i = 0; i < cart.length; i++) {
      print("history list" + cart[i]);

      cartHistory.add(cart[i]);
    }
    removeCart();
    sharedPreferences.setStringList("cart-history-list", cartHistory);
  }

  void removeCart() {
    cart = [];
    sharedPreferences.remove(AppConstants.CART_LIST);
  }
}
