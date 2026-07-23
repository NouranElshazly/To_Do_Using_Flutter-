import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:to_do_app/core/theme/app_color.dart';
import 'package:to_do_app/features/auth/ui/auth.dart';
import 'package:hive/hive.dart';
import 'package:to_do_app/core/utils/app_constant.dart';
import 'package:to_do_app/features/home/ui/home.dart';
import 'package:to_do_app/features/auth/data/models/user_model.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  initState() {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => nextRoute()),
      );
    });
    super.initState();
  }
  // if user login when open app go to home screen else go to auth screen

  Widget nextRoute() {
    if (Hive.box<UserModel>(AppConstant.userBox).isEmpty) {
      return const Auth();
    } else {
      return const Home();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Lottie.asset("assets/images/todo.json")),
    );
  }
}
