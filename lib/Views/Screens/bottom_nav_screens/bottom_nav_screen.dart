import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_task/Data/utils/app_icons.dart';
import 'package:test_task/Views/Screens/Product_screen/product_screen.dart';
import 'package:test_task/Views/Screens/profile_screen/profile_screen.dart';

import '../category_screen/categories_screen.dart';
import '../favourite_screen/favourite_screen.dart';
import 'component/bottom_nav_items.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({super.key});

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {

  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: pageController,
        children: [

          ProductScreen(),
          CategoriesScreen(),
          FavouriteScreen(),
          ProfileScreen(),
        ],
      ),
      bottomNavigationBar:Container(
       color: Colors.black,
        child: SafeArea(
          child: Container(
            color: Colors.white,
          
            child: Container(

              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.sp),
                  topRight: Radius.circular(10.sp)
                )

              ),
              height: 65.sp,
              child: Row(
                children: [
          
          
                  BottomNavItems(pageController: pageController, title: "Home", currentIndex: 0,icon: AppIcons.product,),
                  BottomNavItems(pageController: pageController, title: "Categories", currentIndex: 1,icon: AppIcons.category,),
                  BottomNavItems(pageController: pageController, title: "Favourite", currentIndex: 2,icon: AppIcons.favourite,),
                  BottomNavItems(pageController: pageController, title: "Mitt konto", currentIndex: 3,icon: AppIcons.person,),
          
          
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
