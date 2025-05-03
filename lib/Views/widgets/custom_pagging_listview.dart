import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:test_task/Controller/cubits/search_cubit/search_cubit.dart';

import 'custom_error_widget.dart';

class CustomPaginatedListview<ItemType> extends StatefulWidget {
  final Widget Function(BuildContext, ItemType, int) itemBuilder;
  final PagingController<dynamic, ItemType> pagingController;
  final bool applyHorizontalPadding;
  final Widget? firstPageLoading;
  final Widget? noItemWidget;

  const CustomPaginatedListview({
    super.key,
    required this.itemBuilder,
    this.firstPageLoading,
    this.noItemWidget,
    this.applyHorizontalPadding = true,
    required this.pagingController,
  });

  @override
  State<CustomPaginatedListview> createState() =>
      _CustomPaginatedListviewState<ItemType>();
}

class _CustomPaginatedListviewState<ItemType>
    extends State<CustomPaginatedListview<ItemType>> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        widget.pagingController.refresh();
        context.read<SearchCubit>().reset();
      },
      child: PagedListView<dynamic, ItemType>(
        // separatorBuilder: (context, index) => 10.verticalSpace,
        // padding: EdgeInsets.symmetric(
        //   horizontal: widget.applyHorizontalPadding ? 20.w : 0.w,
        //   vertical: 16.h,
        // ),
        pagingController: widget.pagingController,
        builderDelegate: PagedChildBuilderDelegate<ItemType>(
          firstPageErrorIndicatorBuilder:
              (context) => SizedBox(
                height: 0.8.sh,
                child: Center(
                  child: CustomErrorWidget(
                    error: widget.pagingController.error,
                    onReload: () {
                      widget.pagingController.refresh();
                    },
                  ),
                ),
              ),
          newPageErrorIndicatorBuilder:
              (context) => Center(child: Text(widget.pagingController.error),),
          noItemsFoundIndicatorBuilder:
              (context) =>
                  widget.noItemWidget ??
                  Container(
                    child: Column(
                      children: [
                        Text(
                          'No Items Found',
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 10.sp),
                        Text('The list is currently empty', style: TextStyle()),
                      ],
                    ),
                  ),
          firstPageProgressIndicatorBuilder:
              (context) =>
                  widget.firstPageLoading ??
                  const Center(child: CircularProgressIndicator()),
          newPageProgressIndicatorBuilder:
              (context) => Padding(
                padding: EdgeInsets.symmetric(vertical: 10.sp),
                child: Center(child: CircularProgressIndicator()),
              ),
          itemBuilder: widget.itemBuilder,
        ),
      ),
    );
  }
}
