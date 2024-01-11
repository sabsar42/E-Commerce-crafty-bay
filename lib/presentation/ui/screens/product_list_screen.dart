import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../state_holders/main_bottom_nav_contoller.dart';
import '../utility/app_colors.dart';
import 'package:get/get.dart';

import '../widget/product_card_item.dart';

class ProductListScreen extends StatefulWidget {
  final String? category;

  const ProductListScreen({super.key, this.category});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: AppColors.primaryColor,
          ),
          onPressed: () {
            Get.find<MainBottomNavController>().backToHome();
          },
        ),
        title: Text(
          widget.category ?? 'PRODUCTS',
          style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 17,
              color: AppColors.primaryColor),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: GridView.builder(
            itemCount: 20,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 0.90,
              mainAxisSpacing: 8,
              crossAxisSpacing: 4,
            ),
            itemBuilder: (context, index) {
              return FittedBox(child: ProductCardItem());
            }),
      ),
    );
  }
}
