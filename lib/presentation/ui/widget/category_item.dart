import 'package:e_commerce_flutter_crafty_bay/presentation/ui/screens/product_list_screen.dart';
import 'package:flutter/material.dart';

import '../../../data/models/category_list_item.dart';
import '../utility/app_colors.dart';
import 'package:get/get.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.categoryListItem,
  });

  final CategoryListItem categoryListItem;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => ProductListScreen(
              category: categoryListItem.categoryName ?? '',
              catrgoryId: categoryListItem.id,
            ));
      },

      child: Column(
        children: [
          Card(
            elevation: 0,
            color: AppColors.primaryColor.withOpacity(0.1),
            child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Image.network(
                  categoryListItem.categoryImg ?? '',
                  width: 40,
                  height: 40,
                )),
          ),
          Text(
            categoryListItem.categoryName ?? '',
            style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 13,
                color: AppColors.primaryColor),
          ),
        ],
      ),
    );
  }
}
