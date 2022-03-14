import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/data/api/repository/cart_repo.dart';
import 'package:untitled/models/cart_model.dart';
import 'package:untitled/models/products_model.dart';
import 'package:untitled/utils/colors.dart';

class CartController extends GetxController {
  final CartRepo cartRepo;
  // this class take popularProductRepo instance and contain method that store response body in a list
  CartController({required this.cartRepo});
  Map<int, CartModel> _items = {};
  Map<int, CartModel> get items => _items;
  void addItem(ProductModel product, int quantity) {
    if (_items.containsKey(product.id!)) {
      var totalItem = 0;
      _items.update(product.id!, (value) {
        totalItem = value.quantity! + quantity;
        return CartModel(
            id: value.id,
            name: value.name,
            price: value.price,
            img: value.img,
            quantity: value.quantity! + quantity,
            isExist: true,
            time: DateTime.now().toString(),
            product: product);
      });
      if (totalItem <= 0) {
        _items.remove(product.id);
      }
    } else {
      if (quantity > 0) {
        _items.putIfAbsent(
            product.id!,
            () => CartModel(
                id: product.id,
                name: product.name,
                price: product.price,
                img: product.img,
                quantity: quantity,
                isExist: true,
                time: DateTime.now().toString(),
                product: product));
      } else {
        Get.snackbar("Item Count", "You shouls at least add an item to cart",
            backgroundColor: AppColors.mainColor, colorText: Colors.white);
      }
    }
    update();
  }

  bool existInCart(ProductModel product) {
    if (_items.containsKey(product.id)) {
      return true;
    }
    return false;
  }

  int getQuantity(ProductModel product) {
    int quantity = 0;
    _items.forEach((key, value) {
      if (key == product.id!) {
        quantity = value.quantity!;
      }
    });
    return quantity;
  }

  int get totalItems {
    int totalItems = 0;
    _items.forEach((key, value) {
      totalItems += value.quantity!;
    });
    return totalItems;
  }

  List<CartModel> get getItems {
    return _items.entries.map((e) {
      return e.value;
    }).toList();
  }

  int get totalAmount {
    var total = 0;
    _items.forEach((key, value) {
      total += value.quantity! * value.price!;
    });
    return total;
  }
}
