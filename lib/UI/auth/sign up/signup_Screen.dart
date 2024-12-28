import 'package:event_planing/UI/auth/login/login_screen.dart';
import 'package:event_planing/UI/home_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/app_style.dart';
import '../../../utils/assets_manager.dart';
import '../../tabs/widget/custom_elevated_button.dart';
import '../../tabs/widget/custom_text_field.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  static String routeName = "signup screen";

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    double screenWidth = 393;
    double screenHeight = 841;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(AppLocalizations.of(context)!.register),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * (16 / screenWidth)),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                AssetsManager.logo,
                height: height * (186 / screenHeight),
              ),
              SizedBox(
                height: height * (24 / screenHeight),
              ),
              CustomTextField(
                hintText: AppLocalizations.of(context)!.name,
                hintStyle: AppStyle.medium16Grey,
                prefixIcon: Icon(
                  Icons.person,
                  color: AppColors.greyColor,
                ),
              ),
              SizedBox(
                height: height * (16 / screenHeight),
              ),
              CustomTextField(
                hintText: AppLocalizations.of(context)!.email,
                hintStyle: AppStyle.medium16Grey,
                prefixIcon: Icon(
                  Icons.email,
                  color: AppColors.greyColor,
                ),
                suffixIcon: Icon(
                  Icons.visibility_off,
                  color: AppColors.greyColor,
                ),
              ),
              SizedBox(
                height: height * (16 / screenHeight),
              ),
              CustomTextField(
                hintText: AppLocalizations.of(context)!.password,
                hintStyle: AppStyle.medium16Grey,
                prefixIcon: Icon(
                  Icons.lock,
                  color: AppColors.greyColor,
                ),
                suffixIcon: Icon(
                  Icons.visibility_off,
                  color: AppColors.greyColor,
                ),
              ),
              SizedBox(
                height: height * (16 / screenHeight),
              ),
              CustomTextField(
                hintText: AppLocalizations.of(context)!.re_password,
                hintStyle: AppStyle.medium16Grey,
                prefixIcon: Icon(
                  Icons.lock,
                  color: AppColors.greyColor,
                ),
                suffixIcon: Icon(
                  Icons.visibility_off,
                  color: AppColors.greyColor,
                ),
              ),
              SizedBox(
                height: height * (16 / screenHeight),
              ),
              CustomElevatedButton(
                onTab: () {
                  Navigator.pushReplacementNamed(context, HomeScreen.routeName);
                },
                text: AppLocalizations.of(context)!.create_account,
              ),
              SizedBox(
                height: height * (16 / screenHeight),
              ),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(children: [
                  TextSpan(
                      text:
                          "${AppLocalizations.of(context)!.already_have_account}?",
                      style: AppStyle.medium16Black),
                  TextSpan(
                      text: AppLocalizations.of(context)!.login,
                      style: AppStyle.bold16PrimaryItalic.copyWith(
                        decoration: TextDecoration.underline,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.pushReplacementNamed(
                              context, LoginScreen.routeName);
                        }),
                ]),
              ),
              SizedBox(
                height: height * (24 / screenHeight),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
