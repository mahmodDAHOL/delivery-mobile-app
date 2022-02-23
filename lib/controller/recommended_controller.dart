import 'package:get/get.dart';
import 'package:untitled/data/api/repository/recommended_product_repo.dart';
import 'package:untitled/models/products_model.dart';

class RecommendedProductController extends GetxController {
  final RecommendedProductRepo recommendedProductRepo;
  // this class take RecommendedProductRepo instance and contain method that store response body in a list
  RecommendedProductController({required this.recommendedProductRepo});
  List<dynamic> _recommendedProductList = [];
  List<dynamic> get recommendedProductList => _recommendedProductList;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  Future<void> getRecommendedProductList() async {
    Response response =
        await recommendedProductRepo.getRecommendedProductList();
    if (response.statusCode == 200) {
      _recommendedProductList = [];
      _recommendedProductList.addAll(Product.formJson(response.body).products);
      _isLoaded = true;
      update();
    } else {}
  }
}
