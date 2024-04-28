// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:test/featuears/Layout/Layout_cubit.dart/cubit/layout_state.dart';
// import 'package:test/featuears/home/screen/widget/header_section.dart';

// import '../../Layout/Layout_cubit.dart/cubit/layout_cubit.dart';
// import 'widget/home_header.dart';

// class ome extends StatefulWidget {
//   const ome({Key? key}) : super(key: key);

//   @override
//   State<ome> createState() => _omeState();
// }

// class _omeState extends State<ome> {
//   final pageController = PageController();

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;

//     final cubit = BlocProvider.of<LayoutCubit>(context);
//     return BlocConsumer<LayoutCubit, LayoutStates>(
//         listener: (context, state) {},
//         builder: (context, state) {
//           return Scaffold(
//               backgroundColor: Colors.white,
//               body: Padding(
//                   padding:
//                       EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.h),
//                   child: CustomScrollView(
//                     physics: BouncingScrollPhysics(),
//                     shrinkWrap: true,
//                     slivers: [
//                       SliverToBoxAdapter(
//                         child: HomeHeader(),
//                       ),
//                       SliverToBoxAdapter(
//                         child: SizedBox(
//                           height: 15,
//                         ),
//                       ),
//                       SliverToBoxAdapter(
//                         child: SizedBox(
//                           height: 15,
//                         ),
//                       ),
//                       SliverToBoxAdapter(
//                           child: HeaderSection(
//                         textone: "Special for you",
//                         textTow: "See More",
//                       )),
//                     ],
//                   )
//                   //  ListView(
//                   //   physics: const BouncingScrollPhysics(),
//                   //   shrinkWrap: true,
//                   //   children: [
//                   //     const HomeHeader(),
//                   //     const SizedBox(
//                   //       height: 15,
//                   //     ),
//                   //     Row(
//                   //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   //       children: const [
//                   //         Text(
//                   //           "Special for you",
//                   //           style: TextStyle(
//                   //               color: Colors.black,
//                   //               fontSize: 20,
//                   //               fontWeight: FontWeight.normal),
//                   //         ),
//                   //         Text(
//                   //           "See More",
//                   //           style: TextStyle(
//                   //               color: Colors.blueGrey,
//                   //               fontSize: 14,
//                   //               fontWeight: FontWeight.bold),
//                   //         ),
//                   //       ],
//                   //     ),

//                   //     const SizedBox(
//                   //       height: 15,
//                   //     ),

//                   //     // Todo: Display Banners
//                   //     cubit.banners.isEmpty
//                   //         ? const Center(
//                   //             child: CupertinoActivityIndicator(),
//                   //           )
//                   //         : const swiper(),
//                   //     const SizedBox(
//                   //       height: 15,
//                   //     ),
//                   //     // Todo: Smooth Page Indicator

//                   //     Row(
//                   //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   //       children: const [
//                   //         Text(
//                   //           "Categories",
//                   //           style: TextStyle(
//                   //               color: Colors.black,
//                   //               fontSize: 20,
//                   //               fontWeight: FontWeight.normal),
//                   //         ),
//                   //         Text(
//                   //           "See More",
//                   //           style: TextStyle(
//                   //               color: Colors.blueGrey,
//                   //               fontSize: 14,
//                   //               fontWeight: FontWeight.bold),
//                   //         ),
//                   //       ],
//                   //     ),
//                   //     const SizedBox(
//                   //       height: 15,
//                   //     ),
//                   //     cubit.categories.isEmpty
//                   //         ? const Center(
//                   //             child: CupertinoActivityIndicator(),
//                   //           )
//                   //         : SizedBox(
//                   //             height: 70,
//                   //             width: double.infinity,
//                   //             child: ListView.separated(
//                   //                 physics: const BouncingScrollPhysics(),
//                   //                 itemCount: cubit.categories.length,
//                   //                 scrollDirection: Axis.horizontal,
//                   //                 separatorBuilder: (context, index) {
//                   //                   return const SizedBox(
//                   //                     width: 15,
//                   //                   );
//                   //                 },
//                   //                 itemBuilder: (context, index) {
//                   //                   return CircleAvatar(
//                   //                     radius: 30,
//                   //                     backgroundImage: NetworkImage(
//                   //                         cubit.categories[index].url!),
//                   //                   );
//                   //                 }),
//                   //           ),
//                   //     const SizedBox(
//                   //       height: 15,
//                   //     ),
//                   //     Row(
//                   //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   //       children: const [
//                   //         Text(
//                   //           "Products",
//                   //           style: TextStyle(
//                   //               color: Colors.black,
//                   //               fontSize: 20,
//                   //               fontWeight: FontWeight.normal),
//                   //         ),
//                   //         Text(
//                   //           "See More",
//                   //           style: TextStyle(
//                   //               color: Colors.blueGrey,
//                   //               fontSize: 14,
//                   //               fontWeight: FontWeight.bold),
//                   //         ),
//                   //       ],
//                   //     ),
//                   //     const SizedBox(
//                   //       height: 90,
//                   //     ),
//                   //     cubit.products.isEmpty
//                   //         ? const Center(
//                   //             child: CupertinoActivityIndicator(),
//                   //           )
//                   //         : DynamicHeightGridView(
//                   //             crossAxisCount: 2,
//                   //             crossAxisSpacing: 20,
//                   //             mainAxisSpacing: 80,
//                   //             itemCount: cubit.products.length,
//                   //             shrinkWrap: true,
//                   //             physics: const NeverScrollableScrollPhysics(),

//                   //             builder: (context, index) {
//                   //               return GestureDetector(
//                   //                 onTap: () {
//                   //                   Navigator.push(
//                   //                     context,
//                   //                     MaterialPageRoute(
//                   //                       builder: (context) => DetailsScreen(
//                   //                         ppprouduct: cubit.products[index],
//                   //                       ),
//                   //                     ),
//                   //                   );
//                   //                 },
//                   //                 child:
//                   //                  Customcard(
//                   //                     model: cubit.filteredProducts.isEmpty
//                   //                         ? cubit.products[index]
//                   //                         : cubit.filteredProducts[index],
//                   //                     cubit: cubit),
//                   //               );
//                   //             },
//                   //           )
//                   //   ],
//                   // ),
//                   ));
//         });
//   }
// }
