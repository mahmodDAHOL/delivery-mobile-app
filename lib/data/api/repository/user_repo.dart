import 'package:get/get_connect/http/src/response/response.dart';
import 'package:untitled/utils/app_constants.dart';

import '../api_client.dart';

class UserRepo {
  final ApiClient apiClient;
  UserRepo({
    required this.apiClient,
  });
  Future<Response> getUserInfo() async {
    return await apiClient.getData(AppConstants.USER_INFO_URI);
  }
}
