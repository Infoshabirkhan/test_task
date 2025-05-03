import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class MyText extends StatelessWidget {
  const MyText(
      this.text,
      {super.key,

        this.fontSize,
        this.color,
        this.underLine = false,
        this.onTap,
        this.maxLines,
        this.lineSpacing,
        this.textAlign,
        this.textOverflow,
        this.underLineColor,
        this.isDynamic = false,
        this.fontWeight});

  final String text;
  final double? fontSize;
  final Color? color;
  final int? maxLines;
  final double? lineSpacing;
  final VoidCallback? onTap;
  final FontWeight? fontWeight;
  final bool underLine;
  final TextAlign? textAlign;
  final TextOverflow? textOverflow;
  final bool? isDynamic;
  final Color? underLineColor;

  @override
  Widget build(BuildContext context) {
    // var localization = MySharedPref.getLocalizationData();
    return InkWell(
      onTap: onTap,
      child: Text(
        isDynamic == true ? text : text,
        style: GoogleFonts.poppins(
          // fontFamily: "MuseoSans",
          decorationColor: underLineColor,
          decoration: underLine ? TextDecoration.underline : null,
          color: color ?? Colors.black,
          height: lineSpacing,
          fontSize: fontSize ??16.sp,
          fontWeight: fontWeight ?? FontWeight.w400,
        ),
        maxLines: maxLines,
        overflow: textOverflow,
        textAlign: textAlign,
      ),
    );
  }
}
