import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:to_do_app/core/theme/app_text_style.dart';
import 'package:to_do_app/core/widgets/custome_text_form.dart';
import 'package:to_do_app/core/widgets/app_button.dart';
import 'package:hive/hive.dart';
import 'package:to_do_app/core/utils/app_constant.dart';
import 'package:to_do_app/features/auth/data/models/user_model.dart';
import 'package:to_do_app/features/home/ui/home.dart';

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

  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
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
                    backgroundImage: image != null
                        ? FileImage(File(image!.path))
                        : null,
                    child: image == null
                        ? const Icon(Icons.person, size: 60)
                        : null,
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
                CustomeTextForm(
                  controller: nameController,
                  text: "Full Name ",
                  hintText: "Nouran Elshazly",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    } else if (value.length < 3) {
                      return 'Name must be at least 3 characters long';
                    }
                  },
                ),
                SizedBox(height: 20),
                AppButton(
                  title: "Continuo ",
                  onTap: () {
                    if (image == null) {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text("Error"),
                            content: Text("Please select a profile picture."),
                          );
                        },
                      );
                      return;
                    }
                    if (formKey.currentState?.validate() ?? false) {
                      // Handle form submission
                      Hive.box<UserModel>(AppConstant.userBox)
                          .add(
                            UserModel(
                              image: image?.path ?? "  ",
                              name: nameController.text,
                            ),
                          )
                          .then((value) {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => Home()),
                            );
                          })
                          .catchError((error) {
                            print("Error saving user: $error");
                          });
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
