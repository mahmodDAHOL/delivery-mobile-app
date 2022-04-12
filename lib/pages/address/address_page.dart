import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../controller/auth_controller.dart';
import '../../controller/location_controller.dart';
import '../../controller/user_controller.dart';
import '../../utils/colors.dart';
import '../../utils/dimensions.dart';

class AddressPage extends StatefulWidget {
  AddressPage({Key? key}) : super(key: key);

  @override
  State<AddressPage> createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  TextEditingController _addressController = TextEditingController();
  final TextEditingController _contactPersonName = TextEditingController();
  final TextEditingController _contactPersonNumber = TextEditingController();
  late bool _isLogged;
  CameraPosition _cameraPosition =
      CameraPosition(target: LatLng(54.8, 65.5), zoom: 17);
  late LatLng _initialPosition = LatLng(54.8, 65.5);

  @override
  void initState() {
    super.initState();
    _isLogged = Get.find<AuthController>().userLoggedIn();
    bool modelReady = Get.find<UserController>().userModel == null;
    if (_isLogged && modelReady) {
      Get.find<UserController>().getUserInfo();
      if (Get.find<LocationController>().addressList.isNotEmpty) {
        _cameraPosition = CameraPosition(
            target: LatLng(
                double.parse(
                    Get.find<LocationController>().getAddress["latitude"]),
                double.parse(
                    Get.find<LocationController>().getAddress["longitude"])));
        _initialPosition = LatLng(
            double.parse(Get.find<LocationController>().getAddress["latitude"]),
            double.parse(
                Get.find<LocationController>().getAddress["longitude"]));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Address page"),
        backgroundColor: AppColors.mainColor,
      ),
      body: Column(
        children: [
          Container(
            height: Dimensions.height140,
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(
                left: Dimensions.width10 / 2,
                right: Dimensions.width10 / 2,
                top: Dimensions.height10 / 2),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius5),
                border: Border.all(
                    width: 2, color: Theme.of(context).primaryColor)),
            child: Stack(
              children: [
                GoogleMap(
                  initialCameraPosition:
                      CameraPosition(target: _initialPosition, zoom: 17),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
