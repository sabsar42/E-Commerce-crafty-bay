import 'package:get/get.dart';

class MainBottomNavController extends GetxController {
  int _selctedIndex = 0;

  int get currentIndex => _selctedIndex;

  void changeIndex(int index) {
    if (index == _selctedIndex) {
      return;
    }
    _selctedIndex = index;
    update();
  }

  void backToHome() {
    changeIndex(0);
  }
}
