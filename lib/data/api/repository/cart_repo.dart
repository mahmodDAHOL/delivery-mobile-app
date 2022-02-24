import 'package:get/get.dart';
import 'package:untitled/data/api/api_client.dart';
import 'package:untitled/utils/app_constants.dart';

class CartRepo extends GetxService {
  final ApiClient apiClient;
  // this class take apiClient instance and contain method that take url and get response
  CartRepo({required this.apiClient});
  Future<Response> cartList() async {
    return await apiClient.getData(AppConstants.CART_URI);
  }
}
