import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_task/Data/utils/app_icons.dart';

import 'package:test_task/Views/widgets/custom_button.dart';

import 'my_text.dart';

class CustomErrorWidget extends StatelessWidget {
  final String error;
  final VoidCallback onReload ;
  const CustomErrorWidget({super.key,required this.error,required this.onReload});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        // color: Colors.red
        // ,
        // height: 0.8.sh,
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 20.sp),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [



              SvgPicture.asset(AppIcons.warningIcon),


              MyText('Something went wrong',fontSize: 20.sp,fontWeight: FontWeight.w600,),

              10.verticalSpace,
              MyText(error,textAlign: TextAlign.center,),
              5.verticalSpace,

              MyText("Please try again later",textAlign: TextAlign.center,fontSize: 18.sp,fontWeight: FontWeight.w400,color: Color(0xff1F1729),),
              // 20.verticalSpace,
              // Spacer(),
              30.verticalSpace,
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 20.sp),
                child:CustomButton(onPressed: onReload, text: "Retry"),
              )

            ],
          ),
        ),
      ),
    );
  }
}
