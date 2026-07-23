import 'package:flutter/material.dart';
import 'package:to_do_app/core/theme/app_text_style.dart';

class CustomeTextForm extends StatelessWidget {
  final String text;
  final String hintText;
  final String? Function(String?)? validator;
  final int? maxLines;
  final bool? readOnly;
  final void Function()? onTap;

  final TextEditingController? controller;
  const CustomeTextForm({
    super.key,
    this.controller,
    required this.text,
    required this.hintText,
    required this.validator,
    this.maxLines,
    this.readOnly,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(text, style: AppTextStyle.body1),
        SizedBox(height: 10),
        TextFormField(
          controller: controller,
          onTapOutside: (v) {
            FocusScope.of(context).unfocus();
          },
          maxLines: maxLines,
          readOnly: readOnly ?? false,
          onTap: onTap,

          // validator for the name field
          validator: validator,
          decoration: InputDecoration(
            hintText: hintText,
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
