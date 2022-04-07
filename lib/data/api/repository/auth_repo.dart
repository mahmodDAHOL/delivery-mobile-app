import 'package:get/get_connect.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/utils/app_constants.dart';

import '../../../models/signup_body_model.dart';
import '../api_client.dart';

class AuthRepo {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;
  AuthRepo({required this.apiClient, required this.sharedPreferences});
  bool userLoggedIn() {
    return sharedPreferences.containsKey(AppConstants.TOKEN);
  }

  Future<Response> registration(SignUpBody signUpBody) async {
    return await apiClient.post(
        AppConstants.REGISTRATION_URI, signUpBody.toJson());
  }

  Future<Response> login(String email, String password) async {
    return await apiClient
        .post(AppConstants.LOGIN_URI, {"email": email, "password": password});
  }

  Future<bool> saveUserToken(String token) async {
    apiClient.token = token;
    apiClient.updateHeader(token);
    return await sharedPreferences.setString(AppConstants.TOKEN, token);
  }

  Future<void> saveUserNumberAndPassword(String email, String password) async {
    try {
      await sharedPreferences.setString(AppConstants.PHONE, email);
      await sharedPreferences.setString(AppConstants.PASSWORD, password);
    } catch (e) {
      throw e;
    }
  }

  bool clearSharedData() {
    sharedPreferences.remove(AppConstants.PASSWORD);
    sharedPreferences.remove(AppConstants.PHONE);
    sharedPreferences.remove(AppConstants.TOKEN);
    apiClient.token = "";
    apiClient.updateHeader("");
    return true;
  }
}
