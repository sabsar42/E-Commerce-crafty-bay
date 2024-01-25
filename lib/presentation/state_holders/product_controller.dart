
import 'package:get/get.dart';

import '../../data/models/product_list_model.dart';
import '../../data/services/network_caller.dart';
import '../../data/utility/urls.dart';

class ProductController extends GetxController {
  bool _inProgress = false;

  bool get inProgress => _inProgress;

  String _errorMessage = '';

  String get errorMessage => _errorMessage;

  ProductListModel _productListModel = ProductListModel();

  ProductListModel get productListModel => _productListModel;

  Future<bool> getProductList({required int categoryId}) async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    final response =
    await NetworkCaller().getRequest(Urls.productsByCategory(categoryId));
    _inProgress = false;
    if (response.isSuccess) {
      _productListModel = ProductListModel.fromJson(response.responseData);
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }
    update();
    return isSuccess;
  }
}