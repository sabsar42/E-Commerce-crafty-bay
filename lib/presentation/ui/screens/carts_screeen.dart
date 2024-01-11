import 'package:e_commerce_flutter_crafty_bay/presentation/state_holders/main_bottom_nav_contoller.dart';
import 'package:e_commerce_flutter_crafty_bay/presentation/ui/utility/assets_path.dart';
import 'package:e_commerce_flutter_crafty_bay/presentation/ui/widget/product_card_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utility/app_colors.dart';
import 'package:item_count_number_button/item_count_number_button.dart';

import '../widget/carts/card_product_item.dart';

class CartsScreen extends StatefulWidget {
  const CartsScreen({super.key});

  @override
  State<CartsScreen> createState() => _CartsScreenState();
}

class _CartsScreenState extends State<CartsScreen> {
  get index => null;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.find<MainBottomNavController>().backToHome();
        return false; //for Not opting out from the App
      },
      child: Scaffold(
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
            'CART',
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 17,
                color: AppColors.primaryColor),
          ),
        ),
        body: Column(
          children: [
            Expanded(
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      return CrardProductItem();
                    },
                    separatorBuilder: (_, __) => const SizedBox(
                          height: 8,
                        ),
                    itemCount: 4)),
            totalPriceAndCheckOutSection(),
          ],
        ),
      ),
    );
  }

  Container totalPriceAndCheckOutSection() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: AppColors.primaryColor.withOpacity(0.11),
          borderRadius: BorderRadius.only(
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
              Text(
                '12,200 tK',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                    color: AppColors.primaryColor),
              ),
            ],
          ),
          SizedBox(
            width: 100,
            child: ElevatedButton(
              onPressed: () {},
              child: Text('Check Out'),
            ),
          ),
        ],
      ),
    );
  }
}
