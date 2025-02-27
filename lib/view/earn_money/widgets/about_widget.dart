import 'package:flutter/material.dart';
import 'package:fomoplay/constants/app_button.dart';
import 'package:fomoplay/constants/app_colors.dart';
import 'package:fomoplay/constants/constant_widgets/gradient_text.dart';
import 'package:fomoplay/constants/text_widget.dart';
import 'package:fomoplay/generated/assets.dart';
import 'package:fomoplay/main.dart';
import 'package:fomoplay/view/earn_money/widgets/about_faq.dart';
import 'package:fomoplay/view/earn_money/widgets/about_list.dart';

class AboutWidget extends StatelessWidget {
  const AboutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
       Container(
         height: height*0.2,
         width: width,
         decoration: const BoxDecoration(
           image: DecorationImage(
             image: AssetImage(Assets.imagesEarnmonyAbout),
             fit: BoxFit.fill
           ),
         ),
       ),
        const GradientText(
          'Invite to Earn',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
          gradient: AppColors.gradientText,
        ),
        const TextWidget(
          title: 'Simply share your exclusive QR code',
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color: AppColors.whiteColor
        ),
        SizedBox(
          height: height * 0.02,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: height * 0.07,
              width: width * 0.16,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage(Assets.imagesAboutInvite),
                      fit: BoxFit.fill)),

            ),
            SizedBox(
              width: width * 0.7,
              child: const TextWidget(
                textAlign: TextAlign.start,
                title: 'Invite more friends and you will earn more. Every member\n'
                    'who joins Sky ace Club is both a player and an agent.',
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: AppColors.whiteColor
              ),
            ),
          ],
        ),
        SizedBox(
          height: height * 0.02,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: height * 0.07,
              width: width * 0.16,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage(Assets.imagesEarndimond),
                      fit: BoxFit.fill)),

            ),
            SizedBox(
              width: width * 0.7,
              child: const TextWidget(
                textAlign: TextAlign.start,
                title: 'We advocate benefits and bonuses for everyone.',
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: AppColors.whiteColor
              ),
            ),
          ],
        ),
        SizedBox(
          height: height * 0.03,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 25),
          child: AppBtn(
            titleColor: AppColors.whiteColor,
            hideBorder: true,
            title: 'INVITATION LINK',
            fontSize: 18,
            fontWeight: FontWeight.w900,
            onTap: () async {},
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 15),
          alignment: Alignment.center,
          height: height*0.05,
          width: width*0.9,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(Assets.imagesAgencyPolicyBg),
                  fit: BoxFit.fill)),
          child:  const Center(
            child: Text(
              'Agency Policy',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w900,
                  color: AppColors.whiteColor),
            ),
          ),

        ),
        SizedBox(
          height: height * 0.01,
        ),
        Center(
          child: const TextWidget(
            title: 'The table below shows how the rewards are assigned.',
                fontSize: 10,
                fontWeight: FontWeight.w400,
                color: AppColors.whiteColor
          ),
        ),
        SizedBox(height: 20,),
        AboutList(),
        const Text(
          'FAQ',
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: AppColors.whiteColor),
        ),
        AboutFaq(),
      ],
    );
  }
}
