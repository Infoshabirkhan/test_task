import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:test_task/Controller/cubits/product_cubit/get_all_product_cubit.dart';
import 'package:test_task/Controller/cubits/search_cubit/search_cubit.dart';
import 'package:test_task/Data/model/product_model.dart';
import 'package:test_task/Views/Screens/Product_screen/components/product_card.dart';
import 'package:test_task/Views/widgets/custom_app_bar.dart';
import 'package:test_task/Views/widgets/custom_error_widget.dart';
import 'package:test_task/Views/widgets/my_text.dart';
import 'package:test_task/Views/widgets/my_text_field.dart';

import '../../widgets/custom_pagging_listview.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  var page = 20;
  final pagingController = PagingController<int, Product>(firstPageKey: 20);

  @override
  void initState() {
    context.read<SearchCubit>().reset();

    pagingController.addPageRequestListener((pageKey) {
      print('=====${pageKey}');
      context.read<GetAllProductCubit>().getProducts(page: pageKey);
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Products'),

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
                context.read<SearchCubit>().searchProduct(
                  name: x.toString(),
                );
              },
            ),
            10.verticalSpace,
            BlocBuilder<GetAllProductCubit, GetAllProductState>(
              builder: (context, state) {
                if (state is GetAllProductLoaded) {
                  return MyText(
                    "${state.model.total} results found",
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
              child: BlocConsumer<GetAllProductCubit, GetAllProductState>(
                listener: (context, state) {
                  if (state is GetAllProductLoaded) {
                    var model = state.model;
                    if (model.total > model.limit) {
                      pagingController.appendPage(model.products, page += 20);
                    } else {
                      pagingController.appendLastPage(model.products);
                    }
                  }
                  if (state is GetAllProductError) {
                    pagingController.error = state.error;
                  }
                },
                builder: (context, state) {
                  if(state is GetAllProductNoInternet){
                    return CustomErrorWidget(error: "Weak or No internet Connection", onReload: (){

                      // pagingController.refresh();

                      context.read<GetAllProductCubit>().getProducts(page: 10);
                    });
                  }else if(state is GetAllProductError){
                  return   CustomErrorWidget(
                      error:state.error,
                      onReload: () {
                        // pagingController.refresh();
                        context.read<GetAllProductCubit>().getProducts(page: 10);

                      },
                    );
                  }
                  return CustomPaginatedListview<Product>(
                    applyHorizontalPadding: false,
                    pagingController: pagingController,
                    firstPageLoading: Center(
                        child: CircularProgressIndicator()),
                    itemBuilder:
                        (context, item, _) =>
                          BlocBuilder<SearchCubit, String>(
                          builder: (context, search) {
                            return Visibility(
                              visible:
                              search.isEmpty
                                  ? true
                                  : item.title.toLowerCase().startsWith(
                                search.toLowerCase(),
                              )
                                  ? true
                                  : false,
                              child: ProductCard(product: item),
                            );
                          },
                        ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
