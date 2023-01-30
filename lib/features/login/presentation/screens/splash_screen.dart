import 'dart:async';
import 'package:bluezone/features/login/presentation/screens/steps.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/util/resources/assets.gen.dart';
import '../../../../core/util/resources/colors_manager.dart';
import '../../../../core/util/resources/constants_manager.dart';
import '../../../../core/util/resources/extensions_manager.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SchedulerBinding.instance.addPostFrameCallback((_) {

      Timer(const Duration(seconds: 2),() {
        navigateAndFinish(context,const StepsScreen());
      });

    });
    ScreenSizes.screenHeight = MediaQuery.of(context).size.height;
    ScreenSizes.screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: ColorsManager.blue,
      body: SafeArea(
        child: Padding(
          padding: designApp,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child:  Image.asset(
                  Assets.images.png.logo,
                  height: 80.h,
                  width: 60.w,
                ),
              ),
              const Spacer(),
              Container(
                height: 1.h,
                width: 40.w,
                decoration: BoxDecoration(
                  color: ColorsManager.white,
                  borderRadius: BorderRadius.circular(10.rSp),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
