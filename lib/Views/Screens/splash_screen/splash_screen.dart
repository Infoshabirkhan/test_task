import 'package:flutter/material.dart';
import 'package:test_task/Data/utils/app_images.dart';
import 'package:test_task/Data/utils/nav_helper.dart';

import '../bottom_nav_screens/bottom_nav_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {

    Future.delayed(Duration(seconds: 3)).then((x){
      NavHelper.replacement(context, BottomNavScreen());
    });
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            bottom: 0,
            left: 0,
            right: 0,
            child: Image.asset(AppImages.splashImage, fit: BoxFit.cover),
          ),
        ],
      ),
    );
  }
}
