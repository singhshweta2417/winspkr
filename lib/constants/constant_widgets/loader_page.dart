import 'package:flutter/material.dart';
import 'package:fomoplay/generated/assets.dart';
import 'package:fomoplay/main.dart';

class LoaderPage extends StatelessWidget {
  const LoaderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return   Container(
      margin: const EdgeInsets.only(top: 50),
      height: height*0.1,
      width: width*0.2,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(Assets.imagesNoDataAvailable),
              fit: BoxFit.fill)),
    );
  }
}
