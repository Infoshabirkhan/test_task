import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart';
import 'package:test_task/Controller/cubits/favourite_cubit/favourite_cubit.dart';
import 'package:test_task/Controller/cubits/product_cubit/product_detail_cubit.dart';
import 'package:test_task/Data/utils/app_colors.dart';
import 'package:test_task/Views/widgets/custom_app_bar.dart';
import 'package:test_task/Views/widgets/custom_error_widget.dart';
import 'package:test_task/Views/widgets/my_text.dart';

import '../../../Data/model/product_model.dart';
import '../../widgets/rating_bar_flutter.dart';

class ProductDetailScreen extends StatefulWidget {
  final int id;

  const ProductDetailScreen({super.key, required this.id});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  void initState() {
    context.read<ProductDetailCubit>().getDetail(id: widget.id);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Product Details", showBackButton: true),
      body: BlocBuilder<ProductDetailCubit, ProductDetailState>(
        builder: (context, state) {
          if (state is ProductDetailError) {
            return CustomErrorWidget(
              error: state.error,
              onReload: () {
                context.read<ProductDetailCubit>().getDetail(id: widget.id);
              },
            );
          } else if (state is ProductDetailLoaded) {
            return ListView(
              children: [
                SizedBox(
                  height: 210.sp,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: state.model.images.length,
                    itemBuilder: (context, index) {
                      return Container(
                        width: 1.sw,
                        color: Colors.grey.withAlpha(50),
                        child: Image.network(state.model.images[index]),
                      );
                    },
                  ),
                ),

                10.verticalSpace,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 14.sp),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: MyText(
                              "Product Details",
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          BlocBuilder<FavouriteCubit, List<Product>>(
                            builder: (context, favouriteItems) {
                              return InkWell(
                                onTap: () {
                                  if (   favouriteItems.any((x)=>x.id == state.model.id)) {
                                    context
                                        .read<FavouriteCubit>()
                                        .removeFromFavourite(
                                          product: state.model,
                                        );
                                  } else {
                                    context.read<FavouriteCubit>().addToFav(
                                      product: state.model,
                                    );
                                  }
                                },
                                child: Icon(
                                  favouriteItems.any((x)=>x.id == state.model.id) ?

                                      Icons.favorite
                                      : Icons.favorite_outline,
                                  size: 32.sp,
                                  color:
                                  favouriteItems.any((x)=>x.id == state.model.id)
                                          ? Colors.red
                                          : AppColors.primaryColor.withAlpha(
                                            400,
                                          ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),

                      4.verticalSpace,
                      // Row(
                      //   children: [
                      //     MyText('Name:',fontSize: 12.sp,fontWeight: FontWeight.w600,),
                      //     5.horizontalSpace,
                      //     Expanded(child: MyText(state.model.title,fontSize: 10.sp,))
                      //   ],
                      // ),
                      getRowItem(label: "Name:", value: state.model.title),
                      getRowItem(
                        label: "Price :",
                        value: "\$${state.model.price}",
                      ),
                      getRowItem(
                        label: "Category :",
                        value: state.model.category,
                      ),
                      state.model.brand != null
                          ? getRowItem(
                            label: "Brand :",
                            value: state.model.brand ?? "",
                          )
                          : SizedBox(),

                      Row(
                        children: [
                          MyText(
                            'Rating:',
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600,
                          ),
                          5.horizontalSpace,
                          Expanded(
                            child: Row(
                              children: [
                                MyText(
                                  state.model.rating.toString(),
                                  fontSize: 10.sp,
                                ),
                                5.horizontalSpace,
                                RatingBarFlutter(value:state.model.rating ,),
                              ],
                            ),
                          ),
                        ],
                      ),
                      10.verticalSpace,
                      MyText(
                        "Description :",
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                      ),
                      MyText(
                        state.model.description.toString(),
                        fontSize: 10.sp,
                      ),

                      10.verticalSpace,

                      MyText(
                        "Product Gallery :",
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                      ),

                      // ListView.builder(
                      //     shrinkWrap: true,
                      //     primary: false,
                      //     itemCount: state.model.images.length,
                      //     physics: NeverScrollableScrollPhysics(),
                      //     itemBuilder: (context,index){
                      //   return Image.network(state.model.images[index]);
                      // })
                    ],
                  ),
                ),
              ],
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  getRowItem({required String label, required String value}) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.sp),
      child: Row(
        children: [
          MyText(label, fontSize: 12.sp, fontWeight: FontWeight.w600),
          5.horizontalSpace,
          Expanded(child: MyText(value, fontSize: 10.sp)),
        ],
      ),
    );
  }
}
