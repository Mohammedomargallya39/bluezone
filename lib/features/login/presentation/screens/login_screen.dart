import 'dart:async';

import 'package:bluezone/core/util/resources/assets.gen.dart';
import 'package:bluezone/core/util/resources/colors_manager.dart';
import 'package:bluezone/core/util/resources/constants_manager.dart';
import 'package:bluezone/core/util/resources/extensions_manager.dart';
import 'package:bluezone/core/util/widgets/myButton.dart';
import 'package:bluezone/core/util/widgets/myText.dart';
import 'package:bluezone/core/util/widgets/myTextFill.dart';
import 'package:bluezone/features/login/presentation/controller/login_cubit.dart';
import 'package:bluezone/features/login/presentation/controller/login_states.dart';
import 'package:bluezone/features/register/presentation/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:phonenumbers/phonenumbers.dart';

import '../../../../core/util/widgets/infoDialog.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    SchedulerBinding.instance.addPostFrameCallback((_) {});

    LoginCubit loginCubit = LoginCubit.get(context);
    final phoneNumberTextController = TextEditingController();
    final passwordController = TextEditingController();


    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: designApp,
            child: BlocBuilder<LoginCubit,LoginStates>(
              builder: (context, state) {
                return Directionality(
                  textDirection: TextDirection.rtl,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: AlignmentDirectional.topEnd,
                          child: SvgPicture.asset(Assets.images.svg.arrowBack,)
                      ),
                      Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              Assets.images.png.logo,
                              height: 20.h,
                              width: 40.w,
                            ),
                           // SvgPicture.asset(Assets.images.svg.logo,),
                            verticalSpace(3.h),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: ColorsManager.blue,),
                                  borderRadius: BorderRadius.circular(30.rSp)
                              ),
                              child: Row(
                                children:  [
                                  Expanded(
                                    child: InkWell(
                                      onTap: () {
                                        if(loginCubit.isPersonal == false)
                                        {
                                          loginCubit.changePersonal();
                                        }
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: loginCubit.isPersonal == true ?ColorsManager.blue : Colors.transparent ,
                                            borderRadius: BorderRadius.circular(30.rSp)
                                        ),
                                        child: Center(
                                          child: myText(
                                            title: 'فرد',
                                            style: Style.medium,
                                            fontSize: 30.rSp,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: InkWell(
                                      onTap: () {
                                        if(loginCubit.isPersonal == true)
                                        {
                                          loginCubit.changePersonal();
                                        }
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: loginCubit.isPersonal == true ? Colors.transparent :ColorsManager.blue,
                                            borderRadius: BorderRadius.circular(30.rSp)
                                        ),
                                        child: Center(
                                          child: myText(
                                            title: 'شركة',
                                            style: Style.medium,
                                            fontSize: 30.rSp,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            verticalSpace(3.h),
                            Align(
                              alignment: AlignmentDirectional.centerStart,
                              child: Row(
                                children: [
                                  myText(
                                    title: 'أدخل رقم هاتفك',
                                    style: Style.medium,
                                    fontSize: 16.rSp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  horizontalSpace(1.w),
                                  myText(
                                    title: '*',
                                    style: Style.medium,
                                    fontSize: 16.rSp,
                                    color: Colors.red,
                                  ),
                                ],
                              ),
                            ),
                            verticalSpace(1.h),
                            Directionality(
                              textDirection: TextDirection.ltr,
                              child: myTextFill(
                                  controller: phoneNumberTextController,
                                  hint: 'رقم الهاتف',
                                  suffixIcon: PhoneNumberFormField(
                                    controller: PhoneNumberEditingController.fromCountryCode('Eg'),
                                    decoration: const InputDecoration(),
                                    countryCodeWidth: 20.w,

                                  ),

                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional.centerStart,
                              child: Row(
                                children: [
                                  myText(
                                    title: 'كلمة المرور',
                                    style: Style.medium,
                                    fontSize: 16.rSp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  horizontalSpace(1.w),
                                  myText(
                                    title: '*',
                                    style: Style.medium,
                                    fontSize: 16.rSp,
                                    color: Colors.red,
                                  ),
                                ],
                              ),
                            ),
                            myTextFill(
                              controller: passwordController,
                              hint: 'كلمة المرور',
                              isPassword: loginCubit.isPassword,
                              suffixIcon: IconButton(
                                  onPressed: ()
                                  {
                                    loginCubit.changeVisibility();
                                  },
                                  icon: loginCubit.isPassword == true ? const Icon(Icons.visibility_outlined) : const Icon(Icons.visibility_off_outlined) ,
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional.centerStart,
                              child: InkWell(
                                onTap: ()
                                {

                                },
                                child: myText(
                                  title: 'نسيت كلمة السر؟',
                                  style: Style.medium,
                                  fontSize: 16.rSp,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.red,
                                ),
                              ),
                            ),
                            verticalSpace(3.h),
                            myButton(
                                text: 'تسجيل الدخول',
                                onPressed: ()
                                {

                                },
                              color: ColorsManager.blue,
                            ),
                            verticalSpace(3.h),
                            myText(
                              title: 'أو',
                              style: Style.medium,
                              fontSize: 16.rSp,
                              fontWeight: FontWeight.w600,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: ColorsManager.blue,),
                                borderRadius: BorderRadius.circular(20.rSp),

                              ),
                              child: myButton(
                                text: 'تسجيل حساب جديد',
                                textStyle: TextStyle(
                                  color: ColorsManager.blue,
                                ),
                                onPressed: ()
                                {
                                  navigateTo(context, RegisterScreen(
                                    isPersonal: loginCubit.isPersonal,
                                  ));
                                  if(loginCubit.isPersonal == false)
                                  {
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            return InfoDialog(
                                              message: 'مميزات الإنضمام إلينا',
                                              buttonText: 'انضم الأن',
                                              color: ColorsManager.blue,
                                              onPressed: ()
                                              {
                                                Navigator.pop(context);
                                              },
                                              height: 50.h,
                                            );
                                          },
                                        );
                                  }
                                },
                                color: Colors.transparent,
                              ),
                            ),

                            verticalSpace(3.h),
                            myText(
                              title: 'دخول عن طريق',
                              style: Style.medium,
                              fontSize: 20.rSp,
                              fontWeight: FontWeight.w600,
                            ),
                            Icon(
                                Icons.facebook,
                                size: 40.rSp,
                            ),
                            myText(
                              title: 'الدخول كزائر',
                              style: Style.medium,
                              fontSize: 20.rSp,
                              fontWeight: FontWeight.w600,
                              color: ColorsManager.blue,
                            ),

                          ],
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
