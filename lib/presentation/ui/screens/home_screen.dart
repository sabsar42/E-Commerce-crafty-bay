import 'package:e_commerce_flutter_crafty_bay/data/models/category_list_item.dart';
import 'package:e_commerce_flutter_crafty_bay/presentation/state_holders/auth_controller.dart';
import 'package:e_commerce_flutter_crafty_bay/presentation/state_holders/category_controller.dart';
import 'package:e_commerce_flutter_crafty_bay/presentation/state_holders/home_banner_controller.dart';
import 'package:e_commerce_flutter_crafty_bay/presentation/state_holders/main_bottom_nav_contoller.dart';
import 'package:e_commerce_flutter_crafty_bay/presentation/ui/screens/auth/verify_email_screen.dart';
import 'package:e_commerce_flutter_crafty_bay/presentation/ui/screens/product_list_screen.dart';
import 'package:e_commerce_flutter_crafty_bay/presentation/ui/utility/assets_path.dart';
import 'package:e_commerce_flutter_crafty_bay/presentation/ui/widget/center_circular_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widget/category_item.dart';
import '../widget/home/circle_icon_button.dart';

import '../widget/home/banner_carousel.dart';
import '../widget/home/section_title.dart';
import '../widget/product_card_item.dart';

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
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(
                height: 8,
              ),
              searchTextField,
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                  height: 210,
                  child: GetBuilder<HomeBannerController>(
                      builder: (homeBannerController) {
                    return Visibility(
                      visible: homeBannerController.inProgress == false,
                      replacement: CenterCircularProgressIndicator(),
                      child: BannerCarousel(
                        bannerList:
                            homeBannerController.bannerListModel.bannerList ??
                                [],
                      ),
                    );
                  })),
              const SizedBox(
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
                    Get.to(() => const ProductListScreen());
                  }),
              productList,
              const SizedBox(
                height: 8,
              ),
              SectionTitle(title: 'Special', onTapSeeAll: () {}),
              productList,
              const SizedBox(
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
      child: GetBuilder<CategoryController>(builder: (categoryController) {
        return Visibility(
          visible: categoryController.inProgress == false,
          replacement: CenterCircularProgressIndicator(),
          child: ListView.separated(
            itemCount: categoryController
                    .categoryListModel?.categoryListItem?.length ??
                0,
            primary: false,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return CategoryItem(
                categoryListItem: categoryController
                    .categoryListModel.categoryListItem![index],
              );
            },
            separatorBuilder: (_, __) {
              return const SizedBox(
                width: 10,
              );
            },
          ),
        );
      }),
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
          return const ProductCardItem();
        },
        separatorBuilder: (_, __) {
          return const SizedBox(
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
        prefixIcon: const Icon(
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
          onTap: () async {
            await Get.find<AuthController>().clearAuthData();
            Get.offAll(() => VerifyEmailScreen());
          },
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
