import 'package:ecommerce/core/widgets/snakbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/widgets/empty_screen.dart';
import '../Layout/Layout_cubit.dart/cubit/layout_cubit.dart';
import '../Layout/Layout_cubit.dart/cubit/layout_state.dart';
import 'appbar.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<LayoutCubit>(context);
    return BlocConsumer<LayoutCubit, LayoutStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
            appBar: buildAppBarfav(context),
            body: Padding(
              padding: EdgeInsets.all(8.0.h),
              child: Column(
                children: [
                  Expanded(
                    child: cubit.favorites.isNotEmpty
                        ? ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            itemCount: cubit.favorites.length,
                            itemBuilder: (context, index) {
                              return Container(
                                margin: EdgeInsets.all(10.h),
                                padding: EdgeInsets.all(10.h),
                                color: Colors.white.withOpacity(0.5),
                                child: Row(
                                  children: [
                                    Image.network(
                                      cubit.favorites[index].image!,
                                      height: 100,
                                      width: 100,
                                      fit: BoxFit.fill,
                                    ),
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    Expanded(
                                        child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          cubit.favorites[index].name!,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        SizedBox(
                                          height: 7.h,
                                        ),
                                        Text(
                                            '${cubit.favorites[index].price!} \$'),
                                        MaterialButton(
                                          onPressed: () {
                                            cubit.AddOrRemoveFromFavorites(
                                                productId: cubit
                                                    .favorites[index].id!
                                                    .toString());
                                            showsnakbarwidget(context,
                                                'Successfuly removed', true);
                                          },
                                          color: Colors.teal,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(25.h),
                                          ),
                                          textColor: Colors.white,
                                          child: const Text(' Remove'),
                                        )
                                      ],
                                    ))
                                  ],
                                ),
                              );
                            },
                          )
                        : const BagEmptyWidget(
                            titleonetow: 'Your Favorite is empty',
                            imagePath: 'assets/images/shopping_cart.png',
                            titleone: 'oops',
                            SubTitle:
                                'Look Like Your Favorite Is Empty  Add SomeThing Now',
                          ),
                  ),
                ],
              ),
            ));
      },
    );
  }
}
