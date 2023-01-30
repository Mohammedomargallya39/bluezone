import 'package:bluezone/core/util/resources/extensions_manager.dart';
import 'package:bluezone/core/util/widgets/myButton.dart';
import 'package:flutter/material.dart';
import '../resources/colors_manager.dart';
import '../resources/constants_manager.dart';
import 'myText.dart';

class InfoDialog extends Dialog {
  final double height;
  final double mainHeight;
  final double value;
  final String message;
  final String buttonText;
  final Color color;
  final Function() onPressed;

  const InfoDialog({
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
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                verticalSpace(1.h),
                defaultAppBar(title: 'مميزات انضمام المتجر الينا', context: context) ,
                verticalSpace(3.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [

                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: const [
                        myText(
                            title: 'مصدر إضافي للأرباح',
                            style: Style.medium,
                            fontWeight: FontWeight.w600,
                        ),
                        myText(
                            title: ' احصل علي المزيد من الطلبات',
                          style: Style.medium,
                          fontWeight: FontWeight.w300,                        )
                      ],
                    ),
                    horizontalSpace(5.w),
                    Icon(Icons.vertical_align_top_sharp,
                      color: ColorsManager.blue,),
                  ],
                ),
                verticalSpace(1.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [

                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: const [
                        myText(
                          title: 'زبائن جدد',
                          style: Style.medium,
                          fontWeight: FontWeight.w600,
                        ),
                        myText(
                          title: 'سلط الضوء علي نشاطك',
                          style: Style.medium,
                          fontWeight: FontWeight.w300,                        )
                      ],
                    ),
                    horizontalSpace(5.w),
                    Icon(Icons.person,
                      color: ColorsManager.blue,
                    ),
                  ],
                ),
                verticalSpace(1.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [

                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: const [
                        myText(
                          title: 'مشاهدات أكتر',
                          style: Style.medium,
                          fontWeight: FontWeight.w600,
                        ),
                        myText(
                          title: 'مميزات فريدة للأنشطة التجارية',
                          style: Style.medium,
                          fontWeight: FontWeight.w300,
                        )
                      ],
                    ),
                    horizontalSpace(5.w),
                    Icon(Icons.home,
                    color: ColorsManager.blue,
                    ),
                  ],
                ),
                verticalSpace(5.h),
                myButton(
                  text: buttonText,
                  onPressed: onPressed,
                  color: color,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
