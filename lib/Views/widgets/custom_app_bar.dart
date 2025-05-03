import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'my_text.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  // final double height;
  final String title;

  final bool? showBackButton;

  const CustomAppBar({
    super.key,
    this.showBackButton = false,
    required this.title,
    // this.height = kToolbarHeight,
  });

  @override
  Size get preferredSize => Size.fromHeight(100.h);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        height: 50.sp,
        child: Stack(
          children: [
            Positioned(
              top: 0,
              bottom: 0,
              left: 10.sp,
              child: SizedBox(
                width: 45.sp,
                child: Visibility(
                  visible: showBackButton!,
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Icon(Icons.arrow_back_ios_new),
                  ),
                ),
              ),
            ),
            Center(
              child: Text(
                title,
                style:GoogleFonts.playfairDisplay(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w600,
                ),

              ),
            ),
          ],
        ),
      ),
    );
  }
}
