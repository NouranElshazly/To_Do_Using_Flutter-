import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:to_do_app/core/theme/app_text_style.dart';
import 'package:to_do_app/core/widgets/custome_text_form.dart';
import 'package:to_do_app/core/widgets/app_button.dart';

class Auth extends StatefulWidget {
  const Auth({super.key});

  @override
  State<Auth> createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  final picker = ImagePicker();
  XFile? image;

  void pickFromGallery() async {
    image = await picker.pickImage(source: ImageSource.gallery);
    setState(() {});
  }

  void pickFromCamera() async {
    image = await picker.pickImage(source: ImageSource.camera);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              SizedBox(height: 200),
              InkWell(
                onTap: () async {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text(" choose "),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ListTile(
                              leading: Icon(Icons.camera),
                              title: Text("Camera"),
                              onTap: () {
                                pickFromCamera();
                                Navigator.pop(context);
                              },
                            ),
                            ListTile(
                              leading: Icon(Icons.photo),
                              title: Text("Gallery"),
                              onTap: () {
                                pickFromGallery();
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
                child: CircleAvatar(
                  radius: 65,
                  backgroundColor: Colors.grey.shade300,
                  backgroundImage: image != null ? FileImage(File(image!.path)) : null,
                  child: image == null ? const Icon(Icons.person, size: 60) : null,
                ),
              ),
              const SizedBox(height: 20),
              Text('Create Your Profile', style: AppTextStyle.heading1),
              const SizedBox(height: 10),
              Text(
                "Add Your Name and Profile Picture",
                style: AppTextStyle.hintText,
              ),
              SizedBox(height: 20),
              CustomeTextForm(),
              SizedBox(height: 20),
              AppButton(),
            ],
          ),
        ),
      ),
    );
  }
}
