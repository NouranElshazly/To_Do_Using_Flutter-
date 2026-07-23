import 'package:flutter/material.dart';
import 'package:to_do_app/core/theme/app_text_style.dart';
import 'package:to_do_app/features/auth/data/models/user_model.dart';
import 'package:to_do_app/core/utils/app_constant.dart';
import 'package:hive/hive.dart';
import 'dart:io';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    var userData = Hive.box<UserModel>(AppConstant.userBox).getAt(0);

    return Row(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundImage: Image.file(File(userData?.image ?? "")).image,
        ),
        SizedBox(width: 13),
        Expanded(
          child: Column(
            children: [
              Text("Good Morning 👋", style: AppTextStyle.hintText),
              Text(userData?.name ?? " ", style: AppTextStyle.body1),
            ],
          ),
        ),
        Icon(Icons.notification_important_outlined, size: 30),
      ],
    );
  }
}
