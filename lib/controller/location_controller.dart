import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:untitled/models/address_model.dart';
import 'package:geocoding/geocoding.dart';
import '../data/api/repository/location_repo.dart';

class LocationController extends GetxController {
  LocationRepo locationRepo;
  LocationController({required this.locationRepo});
  bool _location = false;
  late Position _position;
  late Position _pickPosition;
  Placemark _placeMark = Placemark();
  Placemark _pickPlaceMark = Placemark();
  List<AddressModel> _addressList = [];
  List<AddressModel> get addressList => _addressList;
  late List<AddressModel> _allAddressList = [];
  List<String> addressTypeList = ["home", "office", "others"];
  int _addressTypeIndex = 0;
  late Map<String, dynamic> _getAddress;
  Map get getAddress => _getAddress;
}
