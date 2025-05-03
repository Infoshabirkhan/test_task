import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../data/utils/app_colors.dart';
import '../../data/utils/app_images.dart';

class MyTextField extends StatefulWidget {
  final bool? enabled;
  final bool? isPasswordField;
  final TextEditingController? controller;
  final String? hintText;
  final String? label;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final int? maxLine;
  final TextInputType? keyboardType;
  final Color? filledColor;
  final bool? isRequired;
  final String? suffixText;
  final GestureTapCallback? onTap;
  final bool readOnly;
  final bool isEmail;
  final List<TextInputFormatter>? inputFormate;
  final int? maxLenght;
  final Color? hintColor;
  final double? height;
  final Function(String)? onChange;
  final bool? noBorder;

  const MyTextField(
      {super.key,
        this.enabled = true,
        this.suffixIcon,
        this.isPasswordField = false,
        this.readOnly = false,
        this.onTap,
        required this.controller,
        this.filledColor,
        this.label,
        this.height,
        this.hintText,
        this.prefixIcon,
        this.onChange,
        this.maxLine,
        this.noBorder = false,
        this.isEmail = false,
        this.keyboardType,
        this.isRequired,
        this.suffixText,
        this.inputFormate,
        this.maxLenght,
        this.hintColor});

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  OutlineInputBorder commonBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(5.sp),
    borderSide: BorderSide(
      width: 1.sp,
      color: AppColors.primaryColor,
    ),
  );
  bool showPassword = true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      child: Container(
        // alignment: Alignment.centerLeft,
        child: Container(
          // padding:
          //     EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: TextField(
            onTap: widget.onTap,
            readOnly: widget.readOnly,
            keyboardType: widget.keyboardType,
            cursorColor: AppColors.primaryColor,
            obscureText: widget.isPasswordField! ? showPassword : false,
            controller: widget.controller,
            maxLines: widget.maxLine ?? 1,
            onChanged: widget.onChange,
            onTapOutside: (event) {
              FocusManager.instance.primaryFocus?.unfocus();
            },
            inputFormatters: widget.inputFormate,
            maxLength: widget.maxLenght,
            style: GoogleFonts.cairo(
                color: Colors.black,
                fontWeight: FontWeight.w700,
                // color: widget.hintColor ?? AppColors.primaryColor,
                fontSize: 13.sp),
            decoration: InputDecoration(
              filled: true,
              counterText: "",
              errorMaxLines: 1,
              isCollapsed: true,
              suffixIconConstraints:
              BoxConstraints(maxHeight: 30.sp, maxWidth: 40.sp),
              prefixIcon: widget.prefixIcon != null
                  ? Center(child: widget.prefixIcon)
                  : null,
              prefixIconConstraints:
              BoxConstraints(maxHeight: 30.sp, maxWidth: 45.sp),
              // isDense: true,
              fillColor: widget.filledColor ?? Colors.transparent,

              contentPadding: EdgeInsets.only(
                // left: 20.sp, right: 10.sp, top: 18.h, bottom: 18.h),
                  left: 20.sp, right: 10.sp, top: 10.h, bottom: 10.h),

              errorStyle: GoogleFonts.cairo(
                fontSize: 12.sp,
                height: 1.sp,
              ),

              hintStyle: GoogleFonts.poppins(
                // color: Colors.blue
                fontSize: 14.sp,
                fontWeight: FontWeight.w300,
                color: Colors.grey,
              ),
              hintText: widget.hintText,
              border: widget.noBorder! ? InputBorder.none : commonBorder,
              enabledBorder: widget.noBorder! ? InputBorder.none : commonBorder,
              focusedBorder: widget.noBorder! ? InputBorder.none : commonBorder,
              focusedErrorBorder: widget.noBorder! ? InputBorder.none : commonBorder,
              disabledBorder: widget.noBorder! ? InputBorder.none : commonBorder,


              errorBorder: widget.noBorder!
                  ? InputBorder.none
                  : OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.sp),
                borderSide: const BorderSide(
                  color: Colors.red,
                  width: 1,
                ),
              ),


            ),
          ),
        ),
      ),
    );
  }
}
