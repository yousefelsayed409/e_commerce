import 'package:ecommerce/core/routes/app_routes.dart';
import 'package:ecommerce/core/widgets/custom_nav.dart';
import 'package:ecommerce/featuears/cart/complet_pay_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/app_styles.dart';
import '../../../core/widgets/defult_button.dart';
import '../../Layout/Layout_cubit.dart/cubit/layout_cubit.dart';

class CheckoutCard extends StatelessWidget {
  const CheckoutCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<LayoutCubit>(context);
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: (15),
        horizontal: (30),
      ),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
            colors: [Colors.white, Colors.white],
            end: Alignment.bottomLeft,
            begin: Alignment.bottomRight),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            offset: const Offset(5, 5),
            blurRadius: 25,
            color: Colors.black.withOpacity(0.3),
          )
        ],
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: (20.h)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text.rich(
                  TextSpan(
                    text: "Total:\n",
                    children: [
                      TextSpan(
                          text: '${cubit.totalPrice} \$',
                          style: AppStyles.textStyle16),
                    ],
                  ),
                ),
                SizedBox(
                  width: (220.w),
                  child: DefaultButton(
                    text: "Check Out",
                    press: () {
                      navigateTo(context, CompletPayScreen());
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
