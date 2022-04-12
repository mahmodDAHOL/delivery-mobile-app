import 'package:shared_preferences/shared_preferences.dart';

import '../api_client.dart';

class LocationRepo {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;
  LocationRepo({required this.sharedPreferences, required this.apiClient});
}
