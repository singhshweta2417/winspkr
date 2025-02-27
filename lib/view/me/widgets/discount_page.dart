import 'package:flutter/material.dart';
import 'package:fomoplay/constants/gradient_app_bar.dart';
import 'package:fomoplay/constants/app_colors.dart';
import 'package:fomoplay/res/no_data_found.dart';
import 'package:fomoplay/constants/text_widget.dart';
import 'package:fomoplay/generated/assets.dart';
import 'package:fomoplay/main.dart';

class DiscountScreen extends StatefulWidget {
  const DiscountScreen({super.key});

  @override
  State<DiscountScreen> createState() => _DiscountScreenState();
}

class _DiscountScreenState extends State<DiscountScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: GradientAppBar(
        gradient: AppColors.appBarGradient,
        centerTitle: true,
        leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios,size: 15,color: AppColors.whiteColor,)
        ),
        title: const TextWidget(
          title: "Discount",
          fontSize: 15,
          fontWeight: FontWeight.w600,
          fontFamily: "openSansSerif",
          color: AppColors.whiteColor,
        ),
      ),
      body: Container(
        height:height,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(Assets.imagesAppBg),
              fit: BoxFit.fill
          ),
        ),
        child: ListView(
          shrinkWrap: true,
          children:  [
            SizedBox(
              height: height*0.2,
            ),
            const NoDataFoundPage(),
          ],
        ),
      )
    );
  }
}
