import 'package:flutter/material.dart';
import 'package:to_do_app/core/theme/app_text_style.dart';

class CustomeTextForm extends StatelessWidget {
  const CustomeTextForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Full Name", style: AppTextStyle.body1),
        SizedBox(height: 10),
        TextFormField(
          onTapOutside: (v) {
            FocusScope.of(context).unfocus();
          },
          decoration: InputDecoration(
            hintText: "Nouran Elshazly ",
            fillColor: Colors.grey.shade200,
            filled: true,
            hintStyle: AppTextStyle.hintText,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide.none,
            ),

            border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
          ),
        ),
      ],
    );
  }
}
