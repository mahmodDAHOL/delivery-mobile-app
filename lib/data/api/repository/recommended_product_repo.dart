import 'package:get/get.dart';
import 'package:untitled/data/api/api_client.dart';
import 'package:untitled/utils/app_constants.dart';

class RecommendedProductRepo extends GetxService {
  final ApiClient apiClient;
  // this class take apiClient instance and contain method that take url and get response
  RecommendedProductRepo({required this.apiClient});
  Future<Response> getRecommendedProductList() async {
    return await apiClient.getData(AppConstants.RECOMMENDED_PRODUCT_URI);
  }
}
