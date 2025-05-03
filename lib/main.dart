import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_task/Data/utils/my_providers.dart';
import 'package:test_task/Views/Screens/splash_screen/splash_screen.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.white, // navigation bar color
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark // status bar color
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {


    return MultiBlocProvider(
     providers: MyProviders.initialize(),
      child: ScreenUtilInit(
          useInheritedMediaQuery: true,
          designSize: Size(
              360,
              800

          ),
          splitScreenMode: true,

          builder: (context,child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false
              ,

            title: 'Flutter Demo',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            ),
            home: SplashScreen()
          );
        }
      ),
    );
  }
}
