import 'package:flutter/material.dart';
import 'package:shoppe/core/widgets/custom_extension.dart';
import 'package:shoppe/features/onboarding/widget/get_started_button.dart';
import 'package:shoppe/features/onboarding/widget/shop_image_and_text.dart';
import 'package:shoppe/features/onboarding/widget/shop_logo_and_name.dart';

import '../../core/themes/colors.dart';
import '../../core/widgets/text_shimmer.dart';

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
              const GetStartedButton(),
              30.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextShimmer(
                    label: "I already have an account",
                    fontSize: 25,
                  ),
                  const Icon(
                    Icons.arrow_forward_ios,
                    color: AppColors.mainBlue,
                    size: 28,
                  )
                ],
              ),
            ],
          ),
        ),
      )),
    );
  }
}
