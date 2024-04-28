import 'package:cached_network_image/cached_network_image.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_color.dart';
import '../../../Layout/Layout_cubit.dart/cubit/layout_cubit.dart';

class SwiperWidget extends StatefulWidget {
  const SwiperWidget({super.key});

  @override
  State<SwiperWidget> createState() => _SwiperWidgetState();
}

class _SwiperWidgetState extends State<SwiperWidget> {
  final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<LayoutCubit>(context);

    return SizedBox(
      height: 150.h,
      width: double.infinity,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(40.h),
        child: Swiper(
          // controller: ,
          itemCount: cubit.banners.length,

          itemBuilder: (context, index) {
            return CachedNetworkImage(
              height: 120.h,
              width: 120.w,
              fit: BoxFit.fill,
              imageUrl: '${cubit.banners[index].url!}',
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  Center(child: CupertinoActivityIndicator()),
              errorWidget: (context, url, error) => Icon(Icons.error),
            );
            // Image.network(
            //       cubit.banners[index].url!,
            //       fit: BoxFit.fill,
            //     );
          },
          pagination: const SwiperPagination(
              margin: EdgeInsets.only(
                top: 0,
              ),
              builder: DotSwiperPaginationBuilder(
                  activeSize: 15,
                  activeColor: AppColors.red,
                  color: AppColors.white)),
        ),
      ),
    );
  }
} 




// PageView.builder(  
//                   controller: pageController,
//                   physics: const BouncingScrollPhysics(),
//                   itemCount: cubit.banners.length,
//                   itemBuilder: (context, index) {
//                     return Image.network(
//                       cubit.banners[index].url!,
//                       fit: BoxFit.fill,
//                     );
//                   });