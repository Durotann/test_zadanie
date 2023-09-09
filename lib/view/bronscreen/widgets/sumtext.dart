import 'package:flutter/material.dart';

class SumText extends StatelessWidget {
  final textapi;
  final text;
  final colors;

  SumText({super.key, this.text, this.textapi, this.colors = 0xff828796});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "${text}",
          style: const TextStyle(
            fontFamily: "SF Pro Display",
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Color(0xff828796),
            height: 19 / 16,
          ),
          textAlign: TextAlign.left,
        ),
        Text(
          "${textapi} ₽",
          style: TextStyle(
            fontFamily: "SF Pro Display",
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: colors,
            height: 19 / 16,
          ),
          textAlign: TextAlign.right,
        )
      ],
    );
  }
}
