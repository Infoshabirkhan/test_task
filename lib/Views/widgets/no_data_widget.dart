import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../Data/utils/app_icons.dart';
import 'my_text.dart';


class NoItemWidget extends StatelessWidget {
  final String? message;
  const NoItemWidget({super.key,this.message});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 1.sw,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 100.sp,
            height: 100.sp,
            child: SvgPicture.asset(
              AppIcons.emptyBox,
              color: Colors.grey.withOpacity(0.5),
            ),
          ),
          MyText(
              'No data found',
              fontSize: 20.sp,
              fontWeight: FontWeight.w600
          ),
          MyText(message??'The list is currently empty',),
        ],
      ),
    );
  }
}
