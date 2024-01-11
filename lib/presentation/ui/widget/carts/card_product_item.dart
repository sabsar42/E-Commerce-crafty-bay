import 'package:e_commerce_flutter_crafty_bay/presentation/state_holders/main_bottom_nav_contoller.dart';
import 'package:e_commerce_flutter_crafty_bay/presentation/ui/utility/assets_path.dart';
import 'package:e_commerce_flutter_crafty_bay/presentation/ui/widget/product_card_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../screens/carts_screeen.dart';
import 'package:item_count_number_button/item_count_number_button.dart';

import '../../utility/app_colors.dart';

class CrardProductItem extends StatefulWidget {
  const CrardProductItem({super.key});

  @override
  State<CrardProductItem> createState() => _CrardProductItemState();
}


class _CrardProductItemState extends State<CrardProductItem> {
  ValueNotifier<int> noOfItem = ValueNotifier(1);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Row(
        children: [
          Image.asset(
            AssetsPath.dummyShoeImagePng,
            width: 100,
          ),
          SizedBox(
            width: 8,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Nike Shoe 21 Edition',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.black38),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Row(
                        children: [
                          Text('Color : RED'),
                          SizedBox(
                            width: 8,
                          ),
                          Text('SIZE : L'),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 80,
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.delete_outline_rounded,
                        color: Colors.black38,
                      ))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    '\$120 tK',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w800,
                        color: AppColors.primaryColor),
                  ),
                  SizedBox(
                    width: 150,
                  ),
                  ValueListenableBuilder(
                      valueListenable: noOfItem,
                      builder: (context, value, _) {
                        return ItemCount(
                          color: AppColors.primaryColor,
                          initialValue: value,
                          minValue: 1,
                          maxValue: 20,
                          onChanged: (v) {
                            noOfItem.value = v.toInt();
                            print('Selected value $value');
                            setState(() {});
                          },
                          step: 1,
                          decimalPlaces: 0,
                        );
                      })
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
