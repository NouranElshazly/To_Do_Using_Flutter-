import 'package:flutter/material.dart';
import 'package:to_do_app/core/theme/app_color.dart';
import 'package:to_do_app/core/theme/app_text_style.dart';

class AppButton extends StatelessWidget {
  final void Function()? onTap;
  final String title;
  const AppButton({super.key, this.onTap, required this.title});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        // height: 50,
        // width: double.infinity,
        // responsive to the screen size
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
          color: AppColor.primaryColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Text(
            title,
            style: AppTextStyle.body1.copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
