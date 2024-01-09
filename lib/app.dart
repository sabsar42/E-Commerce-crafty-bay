import 'package:e_commerce_flutter_crafty_bay/presentation/state_holders/main_bottom_nav_contoller.dart';
import 'package:e_commerce_flutter_crafty_bay/presentation/ui/screens/auth/splash_screens.dart';
import 'package:e_commerce_flutter_crafty_bay/presentation/ui/screens/main_bottom_nav_screen.dart';
import 'package:e_commerce_flutter_crafty_bay/presentation/ui/utility/app_colors.dart';
import 'package:e_commerce_flutter_crafty_bay/presentation/ui/utility/app_theme_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller_binder.dart';

class CraftyBay extends StatelessWidget {
  const CraftyBay({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: AppThemeData.lightThemeData,
      home: const SplashScreen(),
      initialBinding: ControllerBinder(),
    );
  }
}

