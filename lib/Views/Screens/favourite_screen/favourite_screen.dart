import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_task/Controller/cubits/favourite_cubit/favourite_cubit.dart';
import 'package:test_task/Data/utils/app_colors.dart';
import 'package:test_task/Data/utils/nav_helper.dart';
import 'package:test_task/Views/Screens/product_detail_screen/product_detail_screen.dart';
import 'package:test_task/Views/widgets/custom_app_bar.dart';
import 'package:test_task/Views/widgets/my_text.dart';
import 'package:test_task/Views/widgets/no_data_widget.dart';

import '../../../Controller/cubits/search_cubit/search_cubit.dart';
import '../../../Data/model/product_model.dart';
import '../../widgets/my_text_field.dart';
import '../../widgets/rating_bar_flutter.dart';
import 'components/favourite_card.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {

  @override
  void initState() {
    context.read<SearchCubit>().reset();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Favourites'),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 20.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            MyTextField(
              hintText: 'Search Products by name',
              prefixIcon: Icon(Icons.search_rounded),
              controller: TextEditingController(), onChange: (x) {

              context.read<SearchCubit>().searchProduct(name: x.toString());
            },),
            20.verticalSpace,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.sp),
              child: BlocBuilder<FavouriteCubit, List<Product>>(
                builder: (context, state) {
                  return  state.isEmpty ? SizedBox():MyText('${state.length} results found',color: AppColors.primaryColor.withAlpha(100),fontSize: 10.sp,);
                },
              ),
            ),
            10.verticalSpace,
            Expanded(
              child: BlocBuilder<FavouriteCubit, List<Product>>(
                builder: (context, state) {
                  return state.isEmpty ?
                 NoItemWidget(message: "No favourite product found",)
                  :ListView.builder(
                      itemCount: state.length,
                      itemBuilder: (context, index) {
                    return BlocBuilder<SearchCubit, String>(
  builder: (context, search) {
    return Visibility(
        visible:
        search.isEmpty
            ? true
            : state[index].title.toLowerCase().startsWith(
          search.toLowerCase(),
        )
            ? true
            : false,
        child: InkWell(
            onTap: (){
              NavHelper.goto(context, ProductDetailScreen(id: state[index].id));
            },
            child: FavouriteCard(product: state[index],)));
  },
);
                  });
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
