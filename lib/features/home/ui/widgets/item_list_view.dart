import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:to_do_app/core/utils/app_constant.dart';
import 'package:to_do_app/features/add_task/data/models/task_model.dart';
import 'package:to_do_app/features/home/ui/widgets/item_card.dart';
import 'package:hive/hive.dart';

class ItemListView extends StatelessWidget {
  const ItemListView({super.key});

  @override
  Widget build(BuildContext context) {
    List<TaskModel> allTasks = Hive.box<TaskModel>(
      AppConstant.taskBox,
    ).values.toList();
    return allTasks.isEmpty
        ? Lottie.asset("assets/images/Empty.json")
        : Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) => ItemCard(task: allTasks[index]),
              separatorBuilder: (context, index) => SizedBox(height: 20),
              itemCount: allTasks.length,
            ),
          );
  }
}
