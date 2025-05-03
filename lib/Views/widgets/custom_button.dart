
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../data/utils/app_colors.dart';
import 'my_text.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
        required this.onPressed,
        required this.text,
        this.width,
        this.height,
        this.color,
        this.textColor,
        this.borderColor,
        this.indicatorColor,
        this.isLoading = false,
        this.rightIcon,
        this.fontSize,
        this.leftIcon});

  final VoidCallback onPressed;
  final String text;
  final double? height;
  final double? width;
  final Color? color;
  final Color? textColor;
  final Color? borderColor;
  final Widget? rightIcon;
  final bool isLoading;
  final Color? indicatorColor;
  final double? fontSize;
  final Widget? leftIcon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isLoading ? null : onPressed,
      child: Container(
          alignment: Alignment.center,
          width: width ?? MediaQuery.of(context).size.width,
          height: height ?? 52.sp,
          padding: isLoading
              ? EdgeInsets.symmetric(vertical: 4.sp)
              : EdgeInsets.symmetric(horizontal: 4.sp),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.sp),
            color: color ?? AppColors.primaryColor,
            border: Border.all(
              width: 1.sp,
              color: borderColor ?? AppColors.primaryColor,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Visibility(
                  visible: isLoading==false,

                  child: leftIcon ??SizedBox()),
              leftIcon !=null ? 15.horizontalSpace : 0.horizontalSpace,
              isLoading
                  ? Expanded(
                // flex: 7,
                  child: Center(child: CircularProgressIndicator(color: indicatorColor,),))
                  : MyText(
                text,
                fontSize: fontSize ?? 16.sp,
                color: textColor ?? Colors.white,
                fontWeight: FontWeight.w600,
                textOverflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),

              // icon != null ? 10.pw : 0.pw,
              rightIcon != null ? 13.horizontalSpace : 0.horizontalSpace,
              Visibility(
                  visible: isLoading==false,
                  child: rightIcon ??  SizedBox())
            ],
          )),
    );
  }
}
