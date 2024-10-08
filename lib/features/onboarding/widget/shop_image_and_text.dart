import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/themes/const_text.dart';
import '../../../core/themes/styles.dart';

class ShopImageAndText extends StatelessWidget {
  const ShopImageAndText({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            foregroundDecoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.white,
                  Colors.white.withOpacity(0.0),
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                stops: const [0.10, 0.3],
              ),
            ),
            child: SvgPicture.asset("assets/svg/onboarding.svg")),
        Positioned(
          bottom: 30,
          left: 0,
          right: 0,
          child: Text(
            bestSopping,
            textAlign: TextAlign.center,
            style: TextStyles.font32BlueBold.copyWith(
              height: 1.4,
            ),
          ),
        ),
      ],
    );
  }
}
