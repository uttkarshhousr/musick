import 'package:flutter/material.dart';
import 'package:musick/config/theme/app_utils.dart';
import 'package:musick/config/theme/theme_data.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';




class OutlinedGradientButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final ButtonStyle? style;
  final double thickness;
  final Color? backGroundColor;
  final bool? isGradient;

  const OutlinedGradientButton({
    Key? key,
    required this.onPressed,
    required this.title,
    this.isGradient = true,
    this.style,
    this.thickness = 1, this.backGroundColor=AppColor.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
          gradient:const LinearGradient(colors: [AppColor.gradientColor2, AppColor.gradientColor1])),
      child: Container(
        color: backGroundColor,
        margin: EdgeInsets.all(thickness),
        child: OutlinedButton(
          onPressed: onPressed,
          style: OutlinedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 36),
            shape:  RoundedRectangleBorder(borderRadius: BorderRadius.circular(0.0)),
            enableFeedback: false,
            side:const BorderSide(
              color: Colors.transparent,
            ),
          ),
          child: Column(
            children: [
              GradientText(
                title,
                style: myThemePlayfair.textTheme.displaySmall?.copyWith(color: AppColor.white,fontWeight: FontWeight.w600),
                colors:const  [
                  AppColor.gradientColor2, AppColor.gradientColor1
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

