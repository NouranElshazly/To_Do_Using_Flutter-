import 'package:flutter/material.dart';
import 'package:to_do_app/features/add_task/ui/add_task_screen.dart';
import 'package:to_do_app/features/home/ui/widgets/home_app_bar.dart';
import 'package:to_do_app/core/theme/app_color.dart';
import 'package:to_do_app/core/theme/app_text_style.dart';
import 'package:to_do_app/features/home/ui/widgets/item_card.dart';
import 'package:to_do_app/features/home/ui/widgets/item_list_view.dart';
import 'package:to_do_app/features/home/ui/widgets/statistics_card.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              HomeAppBar(),
              SizedBox(height: 20),
              StatisticsCard(),
              SizedBox(height: 20),
              Text(
                "Todays Tasks",
                style: AppTextStyle.heading1.copyWith(
                  color: AppColor.primaryColor,
                ),
              ),
              ItemListView(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddTaskScreen()),
          );
          setState(() {});
        },
        backgroundColor: AppColor.primaryColor,
        label: Row(
          children: [
            Icon(Icons.add, color: Colors.white),
            Text(
              "Add Task",
              style: AppTextStyle.body2.copyWith(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
