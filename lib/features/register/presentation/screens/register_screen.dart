import 'dart:async';

import 'package:bluezone/core/util/resources/assets.gen.dart';
import 'package:bluezone/core/util/resources/extensions_manager.dart';
import 'package:bluezone/core/util/widgets/default_dialog.dart';
import 'package:bluezone/core/util/widgets/infoDialog.dart';
import 'package:bluezone/core/util/widgets/myButton.dart';
import 'package:bluezone/features/login/presentation/screens/login_screen.dart';
import 'package:bluezone/features/register/presentation/controller/register_cubit.dart';
import 'package:bluezone/features/register/presentation/controller/register_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:phonenumbers/phonenumbers.dart';
import '../../../../core/util/resources/colors_manager.dart';
import '../../../../core/util/resources/constants_manager.dart';
import '../../../../core/util/widgets/myText.dart';
import '../../../../core/util/widgets/myTextFill.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key, required this.isPersonal}) : super(key: key);
  bool isPersonal;
  @override
  Widget build(BuildContext context) {
    final phoneNumberTextController = TextEditingController();
    final phoneNumberWhatsappController = TextEditingController();
    final passwordController = TextEditingController();
    final confirmPasswordController = TextEditingController();
    final nameController = TextEditingController();
    final emailController = TextEditingController();
    final activityController = TextEditingController();
    final storyController = TextEditingController();
    RegisterCubit registerCubit = RegisterCubit.get(context);


    return Scaffold(
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SafeArea(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: BlocBuilder<RegisterCubit,RegisterStates>(
              builder: (context, state) {
                return Column(
                  children: [
                    Container(
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        color: ColorsManager.lightGrey,
                      ),
                      child: defaultAppBar(
                          title: isPersonal == true ? 'إنشاء حساب' : 'إنشاء حساب شركة',
                          context: context
                      ),
                    ),
                    Padding(
                      padding: designApp,
                      child: Column(
                        children: [
                          if(isPersonal != true)
                          verticalSpace(1.h),
                          if(isPersonal != true)
                            Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.rSp),
                              color: Colors.grey.shade300,
                          ),
                            child: Padding(
                              padding: EdgeInsets.all(10.rSp),
                              child: Column(
                                children: [
                                  Icon(
                                      Icons.camera_alt,
                                      size: 40.rSp,
                                      color: ColorsManager.blue,
                                  ),
                                  verticalSpace(1.h),
                                  const myText(
                                      title: 'تحميل شعار الشركة',
                                      style: Style.medium
                                  ),
                                ],
                              ),
                            ),
                          ),
                          verticalSpace(3.h),
                          Align(
                            alignment: AlignmentDirectional.centerStart,
                            child: Row(
                              children: [
                                myText(
                                  title: isPersonal == true ? 'الاسم' : 'اسم الشركة',
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
                            controller: nameController,
                            hint: 'ادخل الاسم',
                          ),
                          if(isPersonal != true)
                          Align(
                            alignment: AlignmentDirectional.centerStart,
                            child: Row(
                              children: [
                                myText(
                                  title: 'نشام الشركة',
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
                          if(isPersonal != true)
                            myTextFill(
                            controller: activityController,
                            hint: 'نشام الشركة',
                          ),
                            Align(
                            alignment: AlignmentDirectional.centerStart,
                            child: Row(
                              children: [
                                myText(
                                  title: 'رقم هاتفك',
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
                          if(isPersonal != true)
                         Align(
                            alignment: AlignmentDirectional.centerStart,
                            child: Row(
                              children: [
                                myText(
                                  title: 'رقم الواتساب',
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
                          if(isPersonal != true)
                          Directionality(
                            textDirection: TextDirection.ltr,
                            child: myTextFill(
                              controller: phoneNumberWhatsappController,
                              hint: 'رقم الواتساب',
                              suffixIcon: PhoneNumberFormField(
                                controller: PhoneNumberEditingController.fromCountryCode('Eg'),
                                decoration: const InputDecoration(),
                                countryCodeWidth: 20.w,

                              ),

                            ),
                          ),

                          Align(
                            alignment: AlignmentDirectional.centerStart,
                            child: myText(
                              title: 'البريد الإلكتروني',
                              style: Style.medium,
                              fontSize: 16.rSp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          myTextFill(
                            controller: emailController,
                            hint: 'أدخل البريد الإلكتروني',
                          ),
                          Align(
                            alignment: AlignmentDirectional.centerStart,
                            child: Row(
                              children: [
                                myText(
                                  title: 'الدولة',
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
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: ColorsManager.darkGrey,),
                                borderRadius: BorderRadius.circular(10.rSp)
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 6.w),
                              child: DropdownButton(
                                isExpanded: true,
                                value: registerCubit.selectedCountry,
                                items: registerCubit.typeValue,
                                onChanged: (value) {
                                  registerCubit.changeDropDownSelectedCountry(value!);
                                },
                              ),
                            ),
                          ),
                          verticalSpace(3.h),
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
                            isPassword: registerCubit.isPassword,
                            suffixIcon: IconButton(
                              onPressed: ()
                              {
                                registerCubit.changePasswordVisibility();
                              },
                              icon: registerCubit.isPassword == true ? const Icon(Icons.visibility_outlined) : const Icon(Icons.visibility_off_outlined) ,
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional.centerStart,
                            child: Row(
                              children: [
                                myText(
                                  title: 'تأكيد كلمة المرور',
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
                            controller: confirmPasswordController,
                            hint: 'تأكيد كلمة المرور',
                            isPassword: registerCubit.isConfirmPassword,
                            suffixIcon: IconButton(
                              onPressed: ()
                              {
                                registerCubit.changeConfirmPasswordVisibility();
                              },
                              icon: registerCubit.isConfirmPassword == true ? const Icon(Icons.visibility_outlined) : const Icon(Icons.visibility_off_outlined) ,
                            ),
                          ),
                          if(isPersonal != true)
                          Align(
                            alignment: AlignmentDirectional.centerStart,
                            child: myText(
                              title: 'روابط السوشيال ميديا',
                              style: Style.medium,
                              fontSize: 16.rSp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          if(isPersonal != true)
                          verticalSpace(3.h),
                          if(isPersonal != true)
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: ColorsManager.darkGrey,),
                              borderRadius: BorderRadius.circular(20.rSp),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(10.rSp),
                              child: Row(
                                children:  [
                                  Expanded(child: Icon(Icons.facebook , size: 50.rSp,)),
                                  Expanded(child: Icon(Icons.facebook , size: 50.rSp,)),
                                  Expanded(child: Icon(Icons.facebook , size: 50.rSp,)),
                                  Expanded(child: Icon(Icons.facebook , size: 50.rSp,)),
                                  Expanded(child: Icon(Icons.facebook , size: 50.rSp,)),
                                ],
                              ),
                            ),
                          ),
                          if(isPersonal != true)
                          verticalSpace(3.h),
                          if(isPersonal != true)
                          Container(
                            width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.rSp),
                                border: Border.all(color: ColorsManager.darkGrey,),
                                color: Colors.grey.shade300,
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(10.rSp),
                                child: Column(
                                  children: [
                                    Icon(
                                      Icons.camera_alt,
                                      size: 60.rSp,
                                      color: ColorsManager.blue,
                                    ),
                                    verticalSpace(1.h),
                                    const myText(
                                        title: 'صور من المتجر',
                                        style: Style.medium
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          if(isPersonal != true)
                            verticalSpace(3.h),
                          if(isPersonal != true)
                            myTextFill(
                            controller: storyController,
                            hint: 'يرجي كتابة نبذه عن نشاطك',
                          ),
                          verticalSpace(3.h),
                          Row(
                            children: [
                              Align(
                                alignment: AlignmentDirectional.centerStart,
                                child: InkWell(
                                  onTap: () {
                                    registerCubit.changeChecked();
                                  },
                                  child: Container(
                                    height: 4.h,
                                    width: 7.w,
                                    decoration: BoxDecoration(
                                      color: registerCubit.isChecked == true ? ColorsManager.blue : ColorsManager.white ,
                                      border: Border.all(color: ColorsManager.blue,),
                                    ),
                                    child: const Center(
                                      child: Icon(
                                          Icons.check,
                                          color: ColorsManager.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              horizontalSpace(10.w),
                              myText(
                                title: 'أوافق علي ',
                                style: Style.medium,
                                fontSize: 16.rSp,
                                fontWeight: FontWeight.w600,
                              ),
                              horizontalSpace(1.w),
                              myText(
                                title: 'الشروط و الأحكام',
                                style: Style.medium,
                                fontSize: 16.rSp,
                                color: ColorsManager.blue,
                              ),
                            ],
                          ),
                          verticalSpace(3.h),
                          myButton(
                              text: 'تسجيل',
                              onPressed: ()
                              {
                                if(isPersonal == true)
                                {
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return DefaultDialog(
                                            message: 'لديك عدد (2) إعلان مجاني',
                                            buttonText: 'تم إنشاء حسابك بنجاح',
                                            color: ColorsManager.blue,
                                            onPressed: ()
                                            {

                                            },
                                             height: 25.h,
                                            // mainHeight: 25.h,
                                        );
                                      },
                                  );
                                }
                              },
                            color: ColorsManager.blue,
                          ),
                          verticalSpace(3.h),
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: ColorsManager.blue,),
                              borderRadius: BorderRadius.circular(20.rSp),

                            ),
                            child: myButton(
                              text: 'لديك حساب؟ سجل دخول',
                              textStyle: TextStyle(
                                color: ColorsManager.blue,
                              ),
                              onPressed: ()
                              {
                                navigateTo(context, const LoginScreen());
                              },
                              color: Colors.transparent,
                            ),
                          ),
                        ],
                      ),
                    ),


                  ],);
              },
          ),
            )),
      ),
    );
  }
}
