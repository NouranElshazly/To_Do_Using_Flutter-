import 'package:flutter/material.dart';
import 'package:to_do_app/core/theme/app_color.dart';
import 'package:to_do_app/core/theme/app_text_style.dart';
import 'package:to_do_app/core/theme/app_color.dart';

class StatisticsCard extends StatelessWidget {
  const StatisticsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColor.primaryColor,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            StatisticsItems(title: "Total", count: 10),
            StatisticsItems(title: "Completed", count: 5),
            StatisticsItems(title: "Pending", count: 5),
          ],
        ),
      ),
    );
  }
}

class StatisticsItems extends StatelessWidget {
  final String title;
  final int count;
  const StatisticsItems({super.key, required this.title, required this.count});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          count.toString(),
          style: TextStyle(
            color: AppColor.whiteColor,
            fontSize: AppTextStyle.body1.fontSize,
            fontWeight: AppTextStyle.body1.fontWeight,
          ),
        ),
        SizedBox(height: 4),
        Text(title, style: TextStyle(color: AppColor.whiteColor, fontSize: 16)),
      ],
    );
  }
}
