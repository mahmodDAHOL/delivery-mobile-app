import 'package:get/get.dart';
import 'package:untitled/utils/app_constants.dart';

class ApiClient extends GetConnect implements GetxService {
  late String token;
  final String appBaseUrl;
  late Map<String, String> _mainHeader;
  ApiClient({required this.appBaseUrl}) {
    baseUrl = appBaseUrl;
    timeout = Duration(seconds: 30);
    token = AppConstants.TOKEN;
    _mainHeader = {
      "content-type": "application/json;charset=UTF-8",
      "Authorization": "Bearer $token",
    };
  }
  void updateHeader(String token) {
    _mainHeader = {
      "content-type": "application/json;charset=UTF-8",
      "Authorization": "Bearer $token",
    };
  }

  // this function take a url and get response message
  Future<Response> getData(String uri) async {
    try {
      Response response = await get(uri);
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

  Future<Response> postData(String uri, dynamic body) async {
    try {
      Response response = await post(uri, body, headers: _mainHeader);
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }
}
