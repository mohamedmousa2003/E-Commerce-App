import 'package:flutter/material.dart';
import 'package:shoppe/core/helpers/spacing.dart';
import 'package:shoppe/core/resources/constants.dart';
import 'package:shoppe/core/widgets/click_button.dart';
import 'package:shoppe/features/onboarding/widget/shop_image_and_text.dart';
import 'package:shoppe/features/onboarding/widget/shop_logo_and_name.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 30,
          ),
          child: Column(
            children: [
              15.height,
              const ShopLogoAndName(),
              30.height,
              const ShopImageAndText(),
              10.height,
              ClickButton(
                onTap: () {
                  //  Navigator.pushReplacementNamed(context, Routes.loginScreen);
                },
                buttonName: getStart,
              ),
              30.height,
            ],
          ),
        ),
      )),
    );
  }
}
