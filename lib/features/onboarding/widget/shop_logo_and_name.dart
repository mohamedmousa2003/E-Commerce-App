import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shoppe/core/helpers/spacing.dart';
import 'package:shoppe/core/resources/assets_manager.dart';
import 'package:shoppe/core/resources/constants.dart';

import '../../../core/widgets/text_shimmer.dart';

class ShopLogoAndName extends StatelessWidget {
  const ShopLogoAndName({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // image logo
        SvgPicture.asset(
          SvgAssets.shopLogo,
          width: 35,
        ),
        4.width,
        TextShimmer(
          label: sopping,
        ),
      ],
    );
  }
}
