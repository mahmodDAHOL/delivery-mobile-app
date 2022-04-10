import 'package:get/get.dart';
import 'package:untitled/models/signup_body_model.dart';

import '../data/api/repository/user_repo.dart';
import '../models/response_model.dart';
import '../models/user_model.dart';

class UserController extends GetxController implements GetxService {
  final UserRepo userRepo;
  UserController({required this.userRepo});
  late UserModel _userModel;
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  UserModel get userModel => _userModel;
  Future<ResponseModel> getUserInfo() async {
    Response response = await userRepo.getUserInfo();
    late ResponseModel responseModel;
    if (response.statusCode == 200) {
      _userModel = UserModel.fromJson(response.body);
      _isLoading = true;
      responseModel = ResponseModel(true, "Successfuly");
    } else {
      responseModel = ResponseModel(false, response.statusText!);
    }
    _isLoading = false;
    update();
    return responseModel;
  }
}
