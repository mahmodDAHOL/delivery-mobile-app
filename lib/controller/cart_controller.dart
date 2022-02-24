import 'package:get/get.dart';
import 'package:untitled/data/api/repository/cart_repo.dart';
import 'package:untitled/models/cart_model.dart';
import 'package:untitled/models/products_model.dart';

class CartController extends GetxController {
  final CartRepo cartRepo;
  // this class take popularProductRepo instance and contain method that store response body in a list
  CartController({required this.cartRepo});
  Map<int, CartModel> _items = {};

  void addItem(ProductModel product, int quantity) {
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
              ));
    }
  }
}
