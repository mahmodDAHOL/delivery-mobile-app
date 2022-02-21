import 'package:get/get.dart';
import 'package:untitled/data/api/repository/popular_product_repo.dart';
import 'package:untitled/models/products_model.dart';

class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;
  // this class take popularProductRepo instance and contain method that store response body in a list
  PopularProductController({required this.popularProductRepo});
  List<dynamic> _popularProductList = [];
  List<dynamic> get popularProductList => _popularProductList;

  Future<void> getPopularProductList() async {
    Response response = await popularProductRepo.getPopularProductList();
    if (response.statusCode == 200) {
      _popularProductList = [];
      _popularProductList.addAll(Product.formJson(response.body).products);
      update();
    } else {}
  }
}
