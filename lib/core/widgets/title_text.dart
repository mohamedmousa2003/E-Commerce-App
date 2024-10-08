import 'package:flutter/material.dart';

class TitleTextWidget extends StatelessWidget {
  const TitleTextWidget({
    super.key,
    required this.label,
    this.fontSize = 18,
    this.fontStyle = FontStyle.normal,
    this.fontWeight = FontWeight.bold,
    this.color,
    this.textDecoration = TextDecoration.none,
    this.maxLines = 1,
  });

  final String label;
  final int? maxLines;
  final double fontSize;
  final FontStyle fontStyle;
  final FontWeight? fontWeight;
  final Color? color;
  final TextDecoration textDecoration;

  @override
  Widget build(BuildContext context) {
    return Text(label,
        maxLines: maxLines,
        style: TextStyle(
            fontSize: fontSize,
            fontWeight: fontWeight,
            color: color,
            fontStyle: fontStyle,
            decoration: textDecoration,
            overflow: TextOverflow.ellipsis));
  }
}
