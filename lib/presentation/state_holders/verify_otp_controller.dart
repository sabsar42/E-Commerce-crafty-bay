import 'package:e_commerce_flutter_crafty_bay/data/services/network_caller.dart';
import 'package:e_commerce_flutter_crafty_bay/presentation/state_holders/read_profile_data_controller.dart';
import 'package:get/get.dart';

import '../../data/utility/urls.dart';

class VerifyOTPController extends GetxController {
  bool _inProgress = false;

  bool get inProgress => _inProgress;

  String _errorMessage = '';

  String get errorMessage => _errorMessage;

  bool _shouldNavigateCompleteProfile = true;

  bool get shouldNavigateCompleteProfile => _shouldNavigateCompleteProfile;

  Future<bool> verifyOTP(String? email, String? otp) async {
    _inProgress = true;
    update();
    final response =
        await NetworkCaller().getRequest(Urls.verifyOtp(email!, otp!));
    _inProgress = false;
    if (response.isSuccess) {
      final token = response.responseData['data'];
      await Future.delayed(const Duration(seconds: 3));
      print(token);
      final result =
          await Get.find<ReadProfileDataController>().readProfileData(token);
      if (result) {
        _shouldNavigateCompleteProfile =
            Get.find<ReadProfileDataController>().isProfileCompleted;
      } else {
        _errorMessage = Get.find<ReadProfileDataController>().errorMessage;
        update();
        return false;
      }
      // SAVE to local cache
      /// if profile exists save existing info
      /// otherwise goto complite profile and save info
      update();
      return true;
    } else {
      _errorMessage = response.errorMessage;
      return false;
    }
  }
}
