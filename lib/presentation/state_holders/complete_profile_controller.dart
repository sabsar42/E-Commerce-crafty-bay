import 'package:get/get.dart';
import 'dart:math';

import 'package:e_commerce_flutter_crafty_bay/data/models/profile_data.dart';
import 'package:get/get.dart';

import '../../data/models/create_profile_params.dart';
import '../../data/models/response_data.dart';
import '../../data/services/network_caller.dart';
import '../../data/utility/urls.dart';

import 'package:get/get.dart';

import 'auth_controller.dart';

class CompleteProfileController extends GetxController {
  bool _inProgress = false;

  bool get inProgress => _inProgress;

  String _errorMessage = '';

  String get errorMessage => _errorMessage;

  Profile _profile = Profile();

  Profile get profile => _profile;

  Future<bool> createProfileData(String token, CreateProfileParams params) async {
    _inProgress = true;
    update();
    final response = await NetworkCaller()
        .postRequest(Urls.createProfile, token: token, body: params.toJson());
    _inProgress = false;
    if (response.isSuccess) {
      _profile = Profile.fromJson(response.responseData['data']);
      await Get.find<AuthController>().saveUserDetails(token, _profile);
      update();
      return true;
    } else {
      _errorMessage = response.errorMessage;
      update();
      return false;
    }
  }
}