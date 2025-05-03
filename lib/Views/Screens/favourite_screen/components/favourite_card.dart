import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../Controller/cubits/favourite_cubit/favourite_cubit.dart';
import '../../../../Data/model/product_model.dart';
import '../../../../Data/utils/app_colors.dart';
import '../../../widgets/my_text.dart';
import '../../../widgets/rating_bar_flutter.dart';

class FavouriteCard extends StatelessWidget {
  final Product product;
  const FavouriteCard({super.key,required this.product});

  @override
  Widget build(BuildContext context) {
                       return Container(
      padding: EdgeInsets.all(10.sp),
      margin: EdgeInsets.only(bottom: 22.sp),
      decoration: BoxDecoration(
          border: Border(
            right: BorderSide(
                color: AppColors.primaryColor.withAlpha(20)
            ),
            left: BorderSide(
                color: AppColors.primaryColor.withAlpha(20)
            ),
            bottom: BorderSide(
                color: AppColors.primaryColor.withAlpha(20)
            ),
          )
        // border: Border.all(color: AppColors.primaryColor.withAlpha(20)),

      ),
      child: Row(
        children: [
          Container(
            width: 62.sp,
            height: 62.sp,
            decoration: BoxDecoration(

                color: Colors.grey.withAlpha(50),
                shape: BoxShape.circle
            ),
            child: Image.network(product.thumbnail),
          ),
          16.horizontalSpace,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyText(product.title,fontSize: 14.sp,fontWeight: FontWeight.w600,),
                MyText('\$${product.price}',fontSize: 11.sp,fontWeight: FontWeight.w600,),
                Row(
                  children: [
                    MyText(product.rating.toString(),fontSize: 10.sp,fontWeight: FontWeight.w600,),
                    5.horizontalSpace,
                    RatingBarFlutter(value:product.rating ,),
                  ],
                ),
              ],
            ),
          ),

          InkWell(
              onTap: (){
                context.read<FavouriteCubit>().removeFromFavourite(product: product);
              },
              child: Icon(Icons.favorite,color: Colors.red,)),
        ],
      ),
    );

  }
}
