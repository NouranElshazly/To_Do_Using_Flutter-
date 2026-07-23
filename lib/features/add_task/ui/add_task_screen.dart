import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:to_do_app/core/theme/app_text_style.dart';
import 'package:to_do_app/core/utils/app_constant.dart';
import 'package:to_do_app/core/widgets/app_button.dart';
import 'package:to_do_app/core/widgets/custome_text_form.dart';
import 'package:to_do_app/features/add_task/data/models/task_model.dart';
import 'package:to_do_app/features/add_task/ui/widgets/color_list_view.dart';
import 'package:hive/hive.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  var formKey = GlobalKey<FormState>();
  var titleController = TextEditingController();
  var descriptionController = TextEditingController();
  var dateController = TextEditingController();
  int? color;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Task ")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomeTextForm(
                controller: titleController,
                text: "Task Title ",
                hintText: "Design Login Screen ",
                validator: (v) {
                  if (v == null || v.isEmpty) {
                    return " please Enter Task Title ";
                  }
                },
              ),
              SizedBox(height: 15),
              CustomeTextForm(
                controller: descriptionController,
                text: 'Description',
                hintText: "Task Description .... ",
                maxLines: 5,
                validator: (v) {
                  if (v == null || v.isEmpty) {
                    return "Description is  required !";
                  }
                },
              ),
              SizedBox(height: 15),
              CustomeTextForm(
                controller: dateController,
                text: "Task Date",
                hintText: "Enter Date ",
                validator: (v) {
                  if (v == null || v.isEmpty) {
                    return "Description is  required !";
                  }
                },

                readOnly: true,
                onTap: () {
                  showDatePicker(
                    context: context,
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2027),
                  ).then((v) {
                    dateController.text = DateFormat.yMEd().format(
                      v ?? DateTime.now(),
                    );
                  });
                },
              ),
              SizedBox(height: 15),
              Text("Choose Color ", style: AppTextStyle.body1),
              SizedBox(height: 15),
              ColorListView(
                onvalue: (c) {
                  color = c?.toARGB32();
                },
              ),
              SizedBox(height: 15),
              AppButton(
                title: "Save ",
                onTap: () {
                  if (color == null) {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text("error"),
                        content: Text('please choose color '),
                      ),
                    );
                    return;
                  }
                  if (formKey.currentState?.validate() ?? false) {
                    Hive.box<TaskModel>(AppConstant.taskBox)
                        .add(
                          TaskModel(
                            title: titleController.text,
                            description: descriptionController.text,
                            date: dateController.text,
                            color: color!,
                          ),
                        )
                        .then((v) {
                          Navigator.pop(context);
                        });
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
