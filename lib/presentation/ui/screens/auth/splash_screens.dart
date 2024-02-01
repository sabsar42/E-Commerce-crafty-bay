import 'package:e_commerce_flutter_crafty_bay/presentation/state_holders/auth_controller.dart';
import 'package:e_commerce_flutter_crafty_bay/presentation/ui/screens/auth/verify_email_screen.dart';
import 'package:e_commerce_flutter_crafty_bay/presentation/ui/screens/main_bottom_nav_screen.dart';
import 'package:e_commerce_flutter_crafty_bay/presentation/ui/widget/app_logo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    moveToNextScreen();
  }

  Future<void> moveToNextScreen() async {
    await Future.delayed(
      const Duration(seconds: 2),
    );
    await Get.find<AuthController>().initialize();
    Get.offAll(const MainBottomNavScreen());
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
          child: Column(
        children: [
          Spacer(),
          AppLogo(),
          Spacer(),
          CircularProgressIndicator(),
          SizedBox(
            height: 16,
          ),
          Text('Version 4.18.0'),
          SizedBox(
            height: 16,
          ),
        ],
      )),
    );
  }
}
