import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoppe/core/themes/styles.dart';
import 'package:shoppe/core/widgets/title_text.dart';

import '../themes/colors.dart';

class ClickButton extends StatelessWidget {
  ClickButton({super.key, required this.buttonName, required this.onTap});

  final String buttonName;

  Function() onTap;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap(),
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(AppColors.mainBlue),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        minimumSize: WidgetStateProperty.all(
          const Size(double.infinity, 52),
        ),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.sp),
          ),
        ),
      ),
      child: TitleTextWidget(
        label: buttonName,
        textStyle: TextStyles.font25WhiteBold,
      ),
    );
  }
}
