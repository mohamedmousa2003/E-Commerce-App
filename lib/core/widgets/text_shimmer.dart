// animation text using the package Shimmer

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shoppe/core/widgets/title_text.dart';

// ignore: must_be_immutable
class TextShimmer extends StatelessWidget {
  TextShimmer({
    super.key,
    this.fontSize = 30,
    required this.label,
    this.colorOne = const Color(0xff5982DA),
    this.colorTwo = Colors.red,
  });

  final String label;
  final double fontSize;
  Color colorOne;
  Color colorTwo;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      period: const Duration(seconds: 2),
      baseColor: colorOne,
      highlightColor: colorTwo,
      child: TitleTextWidget(
        label: label,
        fontSize: fontSize,
      ),
    );
  }
}
