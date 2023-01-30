import 'package:bluezone/core/util/resources/extensions_manager.dart';
import 'package:bluezone/core/util/widgets/myButton.dart';
import 'package:flutter/material.dart';
import '../resources/colors_manager.dart';
import '../resources/constants_manager.dart';
import 'myText.dart';

class DefaultDialog extends Dialog {
  final double height;
  final double mainHeight;
  final double value;
  final String message;
  final String buttonText;
  final Color color;
  final Function() onPressed;

  const DefaultDialog({
    this.height = 160.0,
    this.mainHeight = 160.0,
    this.value = 0.0,
    required this.message,
    required this.buttonText,
    required this.color,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      //this right here
      child: Container(
        height: height,
        width: double.infinity,
        color: ColorsManager.white.withOpacity(0.2),


        child: Container(
          margin: EdgeInsets.all(10.rSp),
          // height: height,
          // width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(color: ColorsManager.blue,),
            borderRadius: BorderRadius.circular(10.rSp)
          ),
          child: Padding(
            padding: EdgeInsets.all(10.rSp),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                myButton(
                    text: buttonText,
                    onPressed: onPressed,
                    color: color,

                ),
                verticalSpace(1.h),
                myText(
                    title: message, align: TextAlign.center, style: Style.large, fontWeight: FontWeight.w600),
                verticalSpace(5.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
