import 'package:flutter/material.dart';
import 'package:musick/config/theme/app_utils.dart';
import 'package:musick/config/theme/theme_data.dart';



class GradientButton extends StatelessWidget {
  final String title;
  final Function onPressed;
  final bool isDisable;
  final IconData? icon;
  const GradientButton(
      {super.key,
        required this.title,
        required this.onPressed,
        this.isDisable = false,
        this.icon});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPressed();
      },
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border.all(color:isDisable ? AppColor.disableButtonTextBlackColor : AppColor.white, width: 1),
          borderRadius: BorderRadius.circular(24),
          color: isDisable ? AppColor.white : null,
          gradient: isDisable
              ? null
              :  LinearGradient(
              colors: [Theme.of(context).colorScheme.primary, Color(0xffFC6C85 )]),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 45.0, vertical: 14),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon!=null
                  ?  Padding(
                padding:const EdgeInsets.only(right: 8.0),
                child: Icon(
                  icon,
                  color: AppColor.black,
                ),
              )
                  : const SizedBox(),
              Text(
                title,
                style: myThemePlayfair.textTheme.displaySmall?.copyWith(
                    color: isDisable
                        ? AppColor.disableButtonTextBlackColor
                        : AppColor.white,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
