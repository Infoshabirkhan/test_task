import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_task/Controller/cubits/categories_cubit/categories_cubit.dart';
import 'package:test_task/Data/utils/nav_helper.dart';
import 'package:test_task/Views/Screens/category_screen/components/category_card.dart';
import 'package:test_task/Views/widgets/custom_app_bar.dart';
import 'package:test_task/Views/widgets/custom_error_widget.dart';
import 'package:test_task/Views/widgets/my_text.dart';

import '../../../Controller/cubits/search_cubit/search_cubit.dart';
import '../../widgets/my_text_field.dart';
import '../product_by_category/product_by_category.dart';
class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<SearchCubit>().reset();
    context.read<CategoriesCubit>().getAllCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Categories'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Field
            MyTextField(
              hintText: 'Search Category by name',
              prefixIcon: Icon(Icons.search_rounded),
              controller: searchController,
              onChange: (x) {
                context.read<SearchCubit>().searchProduct(name: x);
              },
            ),
            10.verticalSpace,

            BlocBuilder<CategoriesCubit, CategoriesState>(
              builder: (context, state) {
                if (state is CategoriesLoaded) {
                  return BlocBuilder<SearchCubit, String>(
                    builder: (context, search) {
                      List filteredCategories = state.model.where((category) {
                        return search.isEmpty
                            ? true
                            : category.name.toLowerCase().startsWith(search.toLowerCase());
                      }).toList();

                      return MyText(
                        '${filteredCategories.length} results found',
                        color: Color(0xff0C0C0C).withAlpha(80),
                        fontSize: 10.sp,
                      );
                    },
                  );
                } else {
                  return SizedBox();
                }
              },
            ),

            20.verticalSpace,

            Expanded(
              child: BlocBuilder<CategoriesCubit, CategoriesState>(
                builder: (context, state) {
                  if (state is CategoriesLoaded) {
                    return BlocBuilder<SearchCubit, String>(
                      builder: (context, search) {
                        /// Filter categories based on search input
                        List filteredCategories = state.model.where((category) {
                          return search.isEmpty
                              ? true
                              : category.name.toLowerCase().startsWith(search.toLowerCase());
                        }).toList();

                        return GridView.builder(
                          itemCount: filteredCategories.length,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 10.sp,
                            crossAxisSpacing: 10.sp,
                          ),
                          itemBuilder: (context, index) {
                            return InkWell(
                             onTap: (){

                               NavHelper.goto(context, ProductByCategoryScreen(model: state.model[index],));
                             },
                              child: CategoryCard(
                                index: index,
                                model: filteredCategories[index],
                              ),
                            );
                          },
                        );
                      },
                    );
                  } else if (state is CategoriesError) {
                    return CustomErrorWidget(
                      error: state.error,
                      onReload: () {
                        context.read<CategoriesCubit>().getAllCategories();
                      },
                    );
                  } else if (state is CategoriesNoInternet) {
                    return CustomErrorWidget(
                      error: 'Weak or no internet connection',
                      onReload: () {
                        context.read<CategoriesCubit>().getAllCategories();
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
