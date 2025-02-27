
import 'package:flutter/material.dart';
import 'package:fomoplay/generated/assets.dart';
import 'package:fomoplay/main.dart';


class CoindesignNew extends StatelessWidget {
  final int otherData;

  const CoindesignNew(this.otherData, {super.key});

  @override
  Widget build(BuildContext context) {
    String imageUrl = '';
    if (otherData == 1) {
      imageUrl = Assets.chips10;
    } else if (otherData == 5) {
      imageUrl = Assets.chips50;
    } else if (otherData == 10) {
      imageUrl = Assets.chips100;
    } else if (otherData == 50) {
      imageUrl = Assets.chips500;
    } else if (otherData == 100) {
      imageUrl = Assets.chips1000;
    } else if (otherData == 500) {
      imageUrl = Assets.chips5000;
    } else if (otherData == 1000) {
      imageUrl = Assets.chips10000;
    }

    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Container(
        height: height*0.033,
        width:  height*0.033,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: AssetImage(
              imageUrl,
            ),
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
