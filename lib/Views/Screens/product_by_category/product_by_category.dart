import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_task/Controller/cubits/product_by_category/product_by_category_cubit.dart';
import 'package:test_task/Views/widgets/custom_error_widget.dart';

import '../../../Controller/cubits/product_cubit/get_all_product_cubit.dart';
import '../../../Controller/cubits/search_cubit/search_cubit.dart';
import '../../../Data/model/categories_model.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/my_text.dart';
import '../../widgets/my_text_field.dart';
import '../Product_screen/components/product_card.dart';

class ProductByCategoryScreen extends StatefulWidget {
  final CategoriesModel model;

  const ProductByCategoryScreen({super.key, required this.model});

  @override
  State<ProductByCategoryScreen> createState() =>
      _ProductByCategoryScreenState();
}

class _ProductByCategoryScreenState extends State<ProductByCategoryScreen> {
  @override
  void initState() {
    context.read<ProductByCategoryCubit>().getProducts(url: widget.model.url);

    // TODO: implement initState
    context.read<SearchCubit>().reset();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: widget.model.name,showBackButton: true,),

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyTextField(
              hintText: 'Search Products by name',
              prefixIcon: Icon(Icons.search_rounded),
              controller: TextEditingController(),
              onChange: (x) {
                context.read<SearchCubit>().searchProduct(name: x.toString());
              },
            ),
            10.verticalSpace,
            BlocBuilder<ProductByCategoryCubit, ProductByCategoryState>(
              builder: (context, state) {
                if (state is ProductByCategoryLoaded) {
                  return MyText(
                    "${state.model.products.length} results found",
                    color: Color(0xff0C0C0C).withAlpha(80),
                    fontSize: 10.sp,
                  );
                } else {
                  return SizedBox();
                }
              },
            ),
            10.verticalSpace,
            Expanded(
              child:
                  BlocBuilder<ProductByCategoryCubit, ProductByCategoryState>(
                    builder: (context, state) {
                      if (state is ProductByCategoryLoaded) {
                        return ListView.builder(
                          itemCount: state.model.products.length,
                          itemBuilder: (context, index) {
                            return BlocBuilder<SearchCubit, String>(
                              builder: (context, search) {
                                return Visibility(
                                  visible:
                                      search.isEmpty
                                          ? true
                                          : state.model.products[index].title
                                              .toLowerCase()
                                              .startsWith(search.toLowerCase())
                                          ? true
                                          : false,

                                  child: ProductCard(
                                    product: state.model.products[index],
                                  ),
                                );
                              },
                            );
                          },
                        );
                      } else if (state is ProductByCategoryError) {
                        return CustomErrorWidget(
                          error: state.error,
                          onReload: () {
                            context.read<ProductByCategoryCubit>().getProducts(
                              url: widget.model.url,
                            );
                          },
                        );
                      } else if (state is ProductByCategoryNoInternet) {
                        return CustomErrorWidget(
                          error: "Weak no internet connection",
                          onReload: () {
                            context.read<ProductByCategoryCubit>().getProducts(
                              url: widget.model.url,
                            );
                          },
                        );
                      } else {
                        return Center(child: CircularProgressIndicator());
                      }
                    },
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
