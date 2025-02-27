import 'package:flutter/material.dart';
import 'package:fomoplay/constants/app_colors.dart';
import 'package:fomoplay/generated/assets.dart';
import 'package:fomoplay/main.dart';

class AvaitorLoadingPage extends StatefulWidget {
  const AvaitorLoadingPage({super.key});

  @override
  State<AvaitorLoadingPage> createState() => _AvaitorLoadingPageState();
}

class _AvaitorLoadingPageState extends State<AvaitorLoadingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldDark,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            Assets.aviatorAviatorWait,
            height: height * 0.40,
          ),
          SizedBox(
            height: height * 0.02,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: const Color(0xffea0b3e)),
                ),
                child: const LinearProgressIndicator(
                  value: 1,
                  backgroundColor: Colors.grey,
                  valueColor: AlwaysStoppedAnimation<Color>(Color(0xffea0b3e)),
                ),
              ),
              const Text('100%'),
              // Text(' ${_linearProgressAnimation.value.toStringAsFixed(2)}%',style: TextStyle(color: Colors.white),),
            ],
          ),
          SizedBox(
            height: height * 0.02,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(Assets.aviatorAviatorText, height: height * 0.035),
              Text(
                " is a verifiably 100% Fomoplay",
                style: TextStyle(fontSize: width * 0.04),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "If you find that the game has modified the game result and submit evidence to "
              "customer service you can receive a maximum compensation of 100000 USDT",
            ),
          )
        ],
      ),
    );
  }
}
