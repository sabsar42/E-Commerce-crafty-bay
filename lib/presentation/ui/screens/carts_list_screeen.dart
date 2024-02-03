import 'package:e_commerce_flutter_crafty_bay/presentation/state_holders/cart_list_controller.dart';
import 'package:e_commerce_flutter_crafty_bay/presentation/state_holders/main_bottom_nav_contoller.dart';
import 'package:e_commerce_flutter_crafty_bay/presentation/ui/widget/center_circular_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utility/app_colors.dart';

import '../widget/carts/card_product_item.dart';

class CartListScreen extends StatefulWidget {
  const CartListScreen({super.key});

  @override
  State<CartListScreen> createState() => _CartListScreenState();
}

class _CartListScreenState extends State<CartListScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<CartListController>().getCartList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (_) {
        Get.find<MainBottomNavController>().backToHome();
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
            'CART',
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 17,
                color: AppColors.primaryColor),
          ),
        ),
        body: GetBuilder<CartListController>(builder: (cartListController) {
          if (cartListController.inProgress) {
            return CenterCircularProgressIndicator();
          }
          return Column(
            children: [
              Expanded(
                  child: ListView.separated(
                      itemBuilder: (context, index) {
                        return CartProductItem(
                          cartItem: cartListController
                              .cartListModel.cartItemList![index],
                        );
                      },
                      separatorBuilder: (_, __) => const SizedBox(
                            height: 8,
                          ),
                      itemCount: cartListController
                              .cartListModel.cartItemList?.length ??
                          0)),
              totalPriceAndCheckOutSection(cartListController.totalPrice),
            ],
          );
        }),
      ),
    );
  }

  Container totalPriceAndCheckOutSection(RxDouble totalPrice) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: AppColors.primaryColor.withOpacity(0.11),
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(18),
            topLeft: Radius.circular(18),
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Total Price',
                style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: Colors.black38),
              ),
              Obx(() {
                return Text(
                  '\$$totalPrice',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                      color: AppColors.primaryColor),
                );
              }),
            ],
          ),
          SizedBox(
            width: 100,
            child: ElevatedButton(
              onPressed: () {},
              child: const Text('Check Out'),
            ),
          ),
        ],
      ),
    );
  }
}
