import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_task/Data/model/categories_model.dart';

import '../../../../Data/utils/app_images.dart';
import '../../../widgets/my_text.dart';

class CategoryCard extends StatelessWidget {
  final int index;
  final CategoriesModel model;
  const CategoryCard({super.key,required this.index,required this.model});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            index % 4 == 0
                ? AppImages.image1
                : index % 4 == 0
                ? AppImages.image2
                : AppImages.laptop,
          ),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(10.sp),
        color: Colors.black,
      ),
      child: Padding(
        padding: EdgeInsets.only(
          left: 10.sp,
          bottom: 10.sp,
        ),
        child: Align(
          alignment: Alignment.bottomLeft,
          child: MyText(
            model.name,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
