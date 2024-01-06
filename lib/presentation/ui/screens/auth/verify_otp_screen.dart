import 'dart:async';

import 'package:e_commerce_flutter_crafty_bay/presentation/ui/widget/app_logo.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../utility/app_colors.dart';
import '../auth/complete_profile_screen.dart';
import 'package:get/get.dart';
class VerifyOTPScreen extends StatefulWidget {
  const VerifyOTPScreen({super.key});

  @override
  State<VerifyOTPScreen> createState() => _VerifyOTPScreenState();
}

class _VerifyOTPScreenState extends State<VerifyOTPScreen> {
  @override
  void initState() {
    super.initState();
    resendOtpCounter();
  }

  Future<dynamic> resendOtpCounter() async {
    dynamic timerC = await Future.delayed(
      const Duration(seconds: 120),
    );
    print(timerC);
    return timerC;
  }

  late dynamic X = resendOtpCounter();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              const SizedBox(
                height: 120,
              ),
              const AppLogo(
                height: 80,
              ),
              const SizedBox(
                height: 24,
              ),
              Text(
                'Enter OTP Code',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                'A 4 digit OTP code has been sent',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(
                height: 24,
              ),
              PinCodeTextField(
                length: 4,
                obscureText: false,
                animationType: AnimationType.fade,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                keyboardType: TextInputType.number,
                pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(5),
                    fieldHeight: 50,
                    fieldWidth: 40,
                    activeFillColor: Colors.transparent,
                    inactiveFillColor: Colors.transparent,
                    inactiveColor: AppColors.primaryColor,
                    selectedFillColor: Colors.transparent,
                    selectedColor: Colors.purple),
                animationDuration: const Duration(milliseconds: 300),
                backgroundColor: Colors.transparent,
                enableActiveFill: true,
                onCompleted: (v) {
                  print("Completed");
                },
                appContext: context,
              ),
              const SizedBox(
                height: 24,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Get.to(const CompleteProfileScreen());
                  },
                  child: const Text('Next'),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              RichText(
                text: const TextSpan(
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                  children: [
                    TextSpan(text: 'This code will expire '),
                    // TODO - make this timer workable
                    TextSpan(
                      text:  's',
                      style: TextStyle(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Resend Code',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
