import 'package:flutter/material.dart';
import 'package:to_do_app/core/theme/app_text_style.dart';
import 'package:to_do_app/features/add_task/data/models/task_model.dart';

class ItemCard extends StatelessWidget {
  final TaskModel task;
  const ItemCard({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(30),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 110,
                width: 25,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Color(task.color),
                ),
              ),
              SizedBox(width: 20),
              Expanded(
                child: Column(
                  spacing: 10,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      task.title,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(task.description, style: TextStyle(fontSize: 16)),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.blue.shade100,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Text(
                        "Pendding",
                        style: (AppTextStyle.body1.copyWith(
                          color: Color(task.color).withValues(alpha: .4),
                        )),
                      ),
                    ),
                  ],
                ),
              ),
              Icon(Icons.arrow_forward_ios, size: 30),
            ],
          ),
        ),
      ),
    );
  }
}
