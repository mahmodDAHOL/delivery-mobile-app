import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/data/api/repository/popular_product_repo.dart';
import 'package:untitled/models/cart_model.dart';
import 'package:untitled/models/products_model.dart';
import 'package:untitled/utils/colors.dart';
import 'cart_controller.dart';

class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;
  // this class take popularProductRepo instance and contain method that store response body in a list
  PopularProductController({required this.popularProductRepo});
  List<dynamic> _popularProductList = [];
  List<dynamic> get popularProductList => _popularProductList;

  late CartController _cart;
  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;
  int _quantity = 0;
  int get quantity => _quantity;
  int _inCartItem = 0;
  int get inCartItem => _inCartItem + _quantity;

  Future<void> getPopularProductList() async {
    Response response = await popularProductRepo.getPopularProductList();
    if (response.statusCode == 200) {
      _popularProductList = [];
      _popularProductList.addAll(Product.formJson(response.body).products);
      _isLoaded = true;
      update();
    } else {}
  }

  void setQuantity(bool isIncrement) {
    if (isIncrement) {
      _quantity = checkQuantity(_quantity + 1);
    } else {
      _quantity = checkQuantity(_quantity - 1);
    }
    update();
  }

  int checkQuantity(int quantity) {
    if ((inCartItem + quantity) < 0) {
      Get.snackbar("Item Count", "you can't reduce more!",
          backgroundColor: AppColors.mainColor, colorText: Colors.white);
      if (_inCartItem > 0) {
        _quantity = -_inCartItem;
        return quantity;
      }
      return 0;
    } else if ((inCartItem + quantity) > 20) {
      Get.snackbar("Item Count", "you can't add more!",
          backgroundColor: AppColors.mainColor, colorText: Colors.white);

      return 20;
    } else {
      return quantity;
    }
  }

  void initProduct(ProductModel product, CartController cart) {
    _quantity = 0;
    _inCartItem = 0;
    _cart = cart;
    bool exist = false;
    exist = cart.existInCart(product);
    if (exist) {
      _inCartItem = _cart.getQuantity(product);
    }
  }

  void addItem(ProductModel product) {
    _cart.addItem(product, _quantity);
    _quantity = 0;
    _inCartItem = _cart.getQuantity(product);
    update();
  }

  int get totalItems {
    return _cart.totalItems;
  }

  List<CartModel> get getItems {
    return _cart.getItems;
  }
}
