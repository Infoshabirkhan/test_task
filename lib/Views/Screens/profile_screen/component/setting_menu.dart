import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../widgets/my_text.dart';

class SettingMenu extends StatelessWidget {
  final String icon;
  final String label;

  const SettingMenu({super.key,required this.icon,required this.label});

  @override
  Widget build(BuildContext context) {
    return      Padding(
      padding: EdgeInsets.symmetric(vertical: 12.sp),
      child: Row(
        children: [

          SvgPicture.asset(icon),
          15.horizontalSpace,
          MyText(label  ),


        ],
      ),
    );

  }
}
