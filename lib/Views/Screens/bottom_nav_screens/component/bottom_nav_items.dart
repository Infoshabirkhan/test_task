import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../Controller/cubits/bottom_nav_cubit/bottom_nav_cubit.dart';
import '../../../widgets/my_text.dart';


class BottomNavItems extends StatelessWidget {
  final String icon;
  final String title;
  final int currentIndex;
  final PageController pageController;

  const BottomNavItems({super.key,    required this.pageController,
    required this.title,
    required this.currentIndex, required this.icon,

  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<BottomNavCubit, int>(
        builder: (context, state) {
          return InkWell(
            onTap: () {
              pageController.jumpToPage(currentIndex);
              context.read<BottomNavCubit>().getIndex(index: currentIndex);
            },
            child: Container(
              // width: 0.25.sw,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: 24.sp,
                    height: 24.sp,
                    child: Center(
                      child: SvgPicture.asset(
                     icon),
                    ),
                  ),
                  10.verticalSpace,
                  Center(
                    child: FittedBox(
                      child: MyText(
                        title,
                        color: Colors.white,
                        // color: state == currentIndex
                        //     ? AppColors.primaryColor
                        //     : Colors.black,
                        fontSize: 12.sp,
                        fontWeight: state == currentIndex
                            ? FontWeight.w500
                            : FontWeight.w400,
                      ),
                    ),
                  ),

                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

