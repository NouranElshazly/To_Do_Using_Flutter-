import 'package:flutter/material.dart';
import 'package:to_do_app/features/add_task/data/models/task_model.dart';
import 'package:to_do_app/to_do_app.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'features/auth/data/models/user_model.dart';
import 'core/utils/app_constant.dart';

void main() async {
  await Hive.initFlutter();

  runApp(const ToDoApp());
  Hive.registerAdapter(UserModelAdapter());
  Hive.registerAdapter(TaskModelAdapter());

  await Hive.openBox<UserModel>(AppConstant.userBox);
  await Hive.openBox<TaskModel>(AppConstant.taskBox);
  // await Hive.box<TaskModel>(AppConstant.taskBox).clear(); // clear the data
}
