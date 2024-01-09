import 'package:e_commerce_flutter_crafty_bay/presentation/state_holders/main_bottom_nav_contoller.dart';
import 'package:get/get.dart';

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.put(MainBottomNavController());
  }
}
