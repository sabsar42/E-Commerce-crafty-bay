import 'package:e_commerce_flutter_crafty_bay/presentation/state_holders/main_bottom_nav_contoller.dart';
import 'package:e_commerce_flutter_crafty_bay/presentation/state_holders/read_profile_data_controller.dart';
import 'package:e_commerce_flutter_crafty_bay/presentation/state_holders/send_email_otp_contoller.dart';
import 'package:e_commerce_flutter_crafty_bay/presentation/state_holders/verify_otp_controller.dart';
import 'package:get/get.dart';

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.put(MainBottomNavController());
    Get.put(SendEmailOtpController());
    Get.put(VerifyOTPController());
    Get.put(ReadProfileDataController());
  }
}
