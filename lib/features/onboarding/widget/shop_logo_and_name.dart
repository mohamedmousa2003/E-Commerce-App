import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shoppe/core/widgets/custom_extension.dart';

import '../../../core/themes/const_text.dart';
import '../../../core/widgets/text_shimmer.dart';

class ShopLogoAndName extends StatelessWidget {
  const ShopLogoAndName({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          "assets/svg/shop_logo.svg",
          width: 35,
        ),
        4.width,
        TextShimmer(
          label: sopping,
          fontSize: 25,
        ),
      ],
    );
  }
}
