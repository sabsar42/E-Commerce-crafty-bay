import 'package:e_commerce_flutter_crafty_bay/presentation/state_holders/category_controller.dart';
import 'package:e_commerce_flutter_crafty_bay/presentation/state_holders/main_bottom_nav_contoller.dart';
import 'package:e_commerce_flutter_crafty_bay/presentation/ui/utility/app_colors.dart';
import 'package:e_commerce_flutter_crafty_bay/presentation/ui/widget/category_item.dart';
import 'package:e_commerce_flutter_crafty_bay/presentation/ui/widget/center_circular_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      // This ( WillPopScope ) Depriciated, so Chnage it to PopScope when Flutte-SDK upadates
      onWillPop: () async {
        Get.find<MainBottomNavController>().backToHome();
        return false; //for Not opting out from the App
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: AppColors.primaryColor,
            ),
            onPressed: () {
              Get.find<MainBottomNavController>().backToHome();
            },
          ),
          title: const Text(
            'CATEGORY',
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 17,
                color: AppColors.primaryColor),
          ),
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            Get.find<CategoryController>().getCategoryList();
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child:
                GetBuilder<CategoryController>(builder: (categoryController) {
              return Visibility(
                visible: categoryController.inProgress == false,
                replacement: CenterCircularProgressIndicator(),
                child: GridView.builder(
                    itemCount: categoryController
                            .categoryListModel?.categoryListItem?.length ??
                        0,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      childAspectRatio: 0.95,
                      mainAxisSpacing: 12,
                      crossAxisSpacing: 8,
                    ),
                    itemBuilder: (context, index) {
                      return FittedBox(
                          child: CategoryItem(
                        categoryListItem: categoryController
                            .categoryListModel.categoryListItem![index],
                      ));
                    }),
              );
            }),
          ),
        ),
      ),
    );
  }
}
