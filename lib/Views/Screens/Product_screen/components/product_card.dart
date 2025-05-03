import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_task/Data/utils/nav_helper.dart';
import 'package:test_task/Views/Screens/product_detail_screen/product_detail_screen.dart';
import 'package:test_task/Views/widgets/my_text.dart';

import '../../../../Data/model/product_model.dart';
import '../../../widgets/rating_bar_flutter.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        NavHelper.goto(context, ProductDetailScreen(id: product.id));
      },
      child: Container(
        padding: EdgeInsets.only(left: 15.sp, right: 15.sp, bottom: 17.sp),
        margin: EdgeInsets.only(bottom: 20.sp),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Color(0xff0C0C0C).withAlpha(30)),
            right: BorderSide(color: Color(0xff0C0C0C).withAlpha(30)),
            left: BorderSide(color: Color(0xff0C0C0C).withAlpha(30)),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Colors.grey.withAlpha(20),
              width: 1.sw,
              height:   172.sp,
              child: Image.network(product.thumbnail),
            ),
            5.verticalSpace,
            Row(
              children: [
                Expanded(
                  child: MyText(
                    product.title,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,

                  ),
                ),
                10.horizontalSpace,
                MyText(
                  "\$ ${product.price}",
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,

                ),
              ],
            ),


            Row(
              children: [
                MyText(product.rating.toString(),fontSize: 10.sp,),
                5.horizontalSpace,
                RatingBarFlutter(value:product.rating ,),

              ],
            ),
            Visibility(
              visible: product.brand !=null,
              child: MyText("by ${product.brand}",
                color: Color(0xff0C0C0C).withAlpha(100),
                fontSize: 10.sp
              ),
            ),
            10.verticalSpace,
            MyText('In ${product.category}',
                fontSize: 10.sp

            ),
          ],
        ),
      ),
    );
  }
}
