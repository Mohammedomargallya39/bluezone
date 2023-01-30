import 'package:bluezone/core/util/resources/assets.gen.dart';
import 'package:bluezone/core/util/resources/colors_manager.dart';
import 'package:bluezone/core/util/resources/constants_manager.dart';
import 'package:bluezone/core/util/resources/extensions_manager.dart';
import 'package:bluezone/core/util/widgets/myButton.dart';
import 'package:bluezone/features/login/presentation/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class StepsScreen extends StatelessWidget {
  const StepsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SchedulerBinding.instance.addPostFrameCallback((_) {});
    return Scaffold(
      backgroundColor: ColorsManager.lightGrey,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: Padding(
                  padding: designApp,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10.rSp))
                    ),
                    child: Image.asset(
                        Assets.images.png.stepCover,
                        fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),

            Container(
              decoration: BoxDecoration(
                  color: ColorsManager.white,
                  borderRadius: BorderRadius.all(Radius.circular(10.rSp))
              ),
              child: Padding(
                padding: designApp,
                child: Column(
                      children: [

                        verticalSpace(0.5.h),
                        myButton(
                            text: 'ابدأ',
                          color: ColorsManager.blue,
                          onPressed: ()
                          {
                            navigateAndFinish(context, const LoginScreen());
                          },
                        ),
                      ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
