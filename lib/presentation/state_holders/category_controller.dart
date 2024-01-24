import 'package:e_commerce_flutter_crafty_bay/data/models/banner_list_model.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../data/models/category_list_model.dart';
import '../../data/services/network_caller.dart';
import '../../data/utility/urls.dart';

class CategoryController extends GetxController {
  bool _inProgress = false;

  bool get inProgress => _inProgress;

  String _errorMessage = '';

  String get errorMessage => _errorMessage;

  CategoryListModel _categoryListModel = CategoryListModel();

  CategoryListModel get categoryListModel => _categoryListModel;

  Future<bool> getCategoryList() async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    final response = await NetworkCaller().getRequest(Urls.categoryList);
    _inProgress = false;
    if (response.isSuccess) {
      _categoryListModel = CategoryListModel.fromJson(response.responseData);
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }
    update();
    return isSuccess;
  }
}
