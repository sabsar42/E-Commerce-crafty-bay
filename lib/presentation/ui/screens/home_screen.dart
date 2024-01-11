import 'package:e_commerce_flutter_crafty_bay/presentation/state_holders/main_bottom_nav_contoller.dart';
import 'package:e_commerce_flutter_crafty_bay/presentation/ui/screens/category_screen.dart';
import 'package:e_commerce_flutter_crafty_bay/presentation/ui/screens/product_list_screen.dart';
import 'package:e_commerce_flutter_crafty_bay/presentation/ui/utility/app_colors.dart';
import 'package:e_commerce_flutter_crafty_bay/presentation/ui/utility/assets_path.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widget/category_item.dart';
import '../widget/home/circle_icon_button.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../widget/home/banner_carousel.dart';
import '../widget/home/section_title.dart';
import '../widget/product_card_item.dart';
import 'main_bottom_nav_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              SizedBox(
                height: 8,
              ),
              searchTextField,
              SizedBox(
                height: 16,
              ),
              BannerCarousel(),
              SizedBox(
                height: 16,
              ),
              SectionTitle(
                title: 'All Categories',
                onTapSeeAll: () {
                  Get.find<MainBottomNavController>().changeIndex(1);
                },
              ),
              categoryList,
              SectionTitle(
                  title: 'Popular',
                  onTapSeeAll: () {
                   Get.to(()=>ProductListScreen());
                  }),
              productList,
              SizedBox(
                height: 8,
              ),
              SectionTitle(title: 'Special', onTapSeeAll: () {}),
              productList,
              SizedBox(
                height: 8,
              ),
              SectionTitle(title: 'New', onTapSeeAll: () {}),
              productList,
            ],
          ),
        ),
      ),
    );
  }

  SizedBox get categoryList {
    return SizedBox(
      height: 120,
      child: ListView.separated(
        itemCount: 10,
        primary: false,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return CategoryItem(
            title: 'Electronics',
          );
        },
        separatorBuilder: (_, __) {
          return SizedBox(
            width: 10,
          );
        },
      ),
    );
  }

  SizedBox get productList {
    return SizedBox(
      height: 190,
      child: ListView.separated(
        itemCount: 10,
        primary: false,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return ProductCardItem();
        },
        separatorBuilder: (_, __) {
          return SizedBox(
            width: 10,
          );
        },
      ),
    );
  }

  TextFormField get searchTextField {
    return TextFormField(
      decoration: InputDecoration(
        hintText: 'Search',
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: Colors.grey.shade200,
        prefixIcon: Icon(
          Icons.search,
          color: Colors.grey,
        ),
      ),
    );
  }

  AppBar get appBar {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      title: Image.asset(AssetsPath.logoNav),
      actions: [
        CircleIconButton(
          onTap: () {},
          iconData: Icons.account_circle_rounded,
        ),
        const SizedBox(
          width: 8,
        ),
        CircleIconButton(
          onTap: () {},
          iconData: Icons.call,
        ),
        const SizedBox(
          width: 8,
        ),
        CircleIconButton(
          onTap: () {},
          iconData: Icons.notifications_active_outlined,
        ),
        const SizedBox(
          width: 12,
        ),
      ],
    );
  }
}
