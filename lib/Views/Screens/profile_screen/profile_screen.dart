import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_task/Data/utils/app_icons.dart';
import 'package:test_task/Views/Screens/profile_screen/component/setting_menu.dart';
import 'package:test_task/Views/widgets/custom_app_bar.dart';
import 'package:test_task/Views/widgets/my_text.dart';

import '../../../Data/utils/app_colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Mitt konto"),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20.sp),
        children: [
          34.verticalSpace,
          Container(
            padding: EdgeInsets.symmetric(vertical: 13.sp, horizontal: 15.sp),
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(5.sp),
            ),
            child: Row(
              children: [
                Container(
                  width: 62.sp,
                  height: 62.sp,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle),
                ),
                16.horizontalSpace,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyText('Shabir khan',color: Colors.white,fontSize: 14.sp,fontWeight: FontWeight.w600,),
                   2.verticalSpace,
                    MyText('infoshabbirkhan@gmail.com',color: Colors.white,fontSize: 10.sp,fontWeight: FontWeight.w400,),
                    MyText('3109688770',color: Colors.white,fontSize: 10.sp,fontWeight: FontWeight.w400,),

                  ],
                )
              ],
            ),
          ),

          50.verticalSpace,
          SettingMenu(icon: AppIcons.setting, label: "Kontoinstallningar"),
          SettingMenu(icon: AppIcons.mina, label: "Mina betalmetoder"),
          SettingMenu(icon: AppIcons.support, label: "Support"),
        ],
      ),
    );
  }
}
