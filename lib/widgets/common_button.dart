import 'package:fetch_flow/core/app_theme/app_colors.dart';
import 'package:fetch_flow/core/app_theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class CommonButton extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  final bool isBlack;
  const CommonButton({super.key, required this.onPressed, required this.text,this.isBlack=false});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(15),
      ),
      color:isBlack?blackColor: whiteColor,
      height: 60,
      minWidth: 260,
      onPressed: onPressed,
      child:isBlack?Text(text, style: AppTextStyles.commonButtonTextWhite): Text(text, style: AppTextStyles.commonButtonText),
    );
  }
}
