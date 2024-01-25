import 'package:e_commerce_flutter_crafty_bay/presentation/state_holders/product_controller.dart';
import 'package:e_commerce_flutter_crafty_bay/presentation/ui/widget/center_circular_progress_indicator.dart';
import 'package:flutter/material.dart';

import '../../state_holders/main_bottom_nav_contoller.dart';
import '../utility/app_colors.dart';
import 'package:get/get.dart';

import '../widget/product_card_item.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key, this.category, this.catrgoryId});

  final String? category;
  final int? catrgoryId;

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  void initState() {
    super.initState();
    if (widget.catrgoryId != null) {
      Get.find<ProductController>()
          .getProductList(categoryId: widget.catrgoryId!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(widget.category ?? 'Products'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: GetBuilder<ProductController>(builder: (productController) {
          return Visibility(
            visible: productController.inProgress == false,
            replacement: CenterCircularProgressIndicator(),
            child: Visibility(
              visible:
                  productController.productListModel.productList?.isNotEmpty ??
                      false,
              replacement: const Center(
                child: Text('No Product'),
              ),
              child: GridView.builder(
                itemCount:
                    productController.productListModel.productList?.length ?? 0,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 0.90,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 4),
                itemBuilder: (context, index) {
                  return FittedBox(
                    child: ProductCardItem(
                      product: productController
                          .productListModel.productList![index],
                    ),
                  );
                },
              ),
            ),
          );
        }),
      ),
    );
  }
}
