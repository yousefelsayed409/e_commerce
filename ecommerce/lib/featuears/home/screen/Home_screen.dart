import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:ecommerce/featuears/home/screen/widget/home_header.dart';
import 'package:ecommerce/featuears/home/screen/widget/swiper_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Details/Detail_screen.dart';
import '../../Layout/Layout_cubit.dart/cubit/layout_cubit.dart';
import '../../Layout/Layout_cubit.dart/cubit/layout_state.dart';
import 'widget/custom_card_widget.dart';
import 'widget/header_section.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<LayoutCubit>(context);
    return BlocConsumer<LayoutCubit, LayoutStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
              body: Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.h),
            child: ListView(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              children: [
                const HomeHeader(),
                const SizedBox(
                  height: 15,
                ),
                const HeaderSection(
                  textone: "Special for you",
                  textTow: "See More",
                ),
                SizedBox(
                  height: 15.h,
                ),

                // Todo: Display Banners
                cubit.banners.isEmpty
                    ? const Center(
                        child: CupertinoActivityIndicator(),
                      )
                    : const SwiperWidget(),
                SizedBox(
                  height: 15.h,
                ),

                const HeaderSection(
                  textone: "Categories",
                  textTow: "See More",
                ),

                SizedBox(
                  height: 15.h,
                ),
                // Todo: Display categories
                cubit.categories.isEmpty
                    ? const Center(
                        child: CupertinoActivityIndicator(),
                      )
                    : SizedBox(
                        height: 70.h,
                        width: double.infinity,
                        child: ListView.separated(
                            physics: const BouncingScrollPhysics(),
                            itemCount: cubit.categories.length,
                            scrollDirection: Axis.horizontal,
                            separatorBuilder: (context, index) {
                              return SizedBox(
                                width: 15.w,
                              );
                            },
                            itemBuilder: (context, index) {
                              return CircleAvatar(
                                radius: 30.h,
                                backgroundImage:
                                    NetworkImage(cubit.categories[index].url!),
                              );
                            }),
                      ),
                SizedBox(
                  height: 15.h,
                ),
                const HeaderSection(textone: "Products", textTow: "See More"),

                SizedBox(
                  height: 90.h,
                ),
                // Todo: Display products
                cubit.products.isEmpty
                    ? const Center(
                        child: CupertinoActivityIndicator(),
                      )
                    : DynamicHeightGridView(
                        crossAxisCount: 2,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 80,
                        itemCount: cubit.products.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        builder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailsScreen(
                                    ppprouduct: cubit.products[index],
                                  ),
                                ),
                              );
                            },
                            child: Customcard(
                                model: cubit.filteredProducts.isEmpty
                                    ? cubit.products[index]
                                    : cubit.filteredProducts[index],
                                cubit: cubit),
                          );
                        },
                      )
              ],
            ),
          ));
        });
  }
}
