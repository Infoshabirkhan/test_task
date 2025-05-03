import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task/Controller/cubits/product_cubit/get_all_product_cubit.dart';
import 'package:test_task/Controller/cubits/search_cubit/search_cubit.dart';

import '../../Controller/cubits/bottom_nav_cubit/bottom_nav_cubit.dart';
import '../../Controller/cubits/categories_cubit/categories_cubit.dart';
import '../../Controller/cubits/favourite_cubit/favourite_cubit.dart';
import '../../Controller/cubits/product_by_category/product_by_category_cubit.dart';
import '../../Controller/cubits/product_cubit/product_detail_cubit.dart';

class MyProviders {
  static List<BlocProvider> initialize() {
    return [
      BlocProvider<BottomNavCubit>(create: (context) => BottomNavCubit(0)),
      BlocProvider<GetAllProductCubit>(
        create: (context) => GetAllProductCubit(),
      ),
      BlocProvider<ProductDetailCubit>(
        create: (context) => ProductDetailCubit(),
      ),
      BlocProvider<FavouriteCubit>(create: (context) => FavouriteCubit([])),
      BlocProvider<SearchCubit>(create: (context) => SearchCubit('')),
      BlocProvider<CategoriesCubit>(create: (context) => CategoriesCubit()),
      BlocProvider<ProductByCategoryCubit>(create: (context) => ProductByCategoryCubit()),
    ];
  }
}
