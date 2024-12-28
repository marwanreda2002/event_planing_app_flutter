import 'package:event_planing/UI/auth/sign%20up/signup_Screen.dart';
import 'package:event_planing/UI/home_screen.dart';
import 'package:event_planing/UI/tabs/widget/custom_text_field.dart';
import 'package:event_planing/utils/app_colors.dart';
import 'package:event_planing/utils/app_style.dart';
import 'package:event_planing/utils/assets_manager.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../tabs/widget/custom_elevated_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static String routeName = "login screen";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    double screenWidth = 393;
    double screenHeight = 841;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * (16 / screenWidth)),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: height * (48 / screenHeight),
              ),
              Image.asset(
                AssetsManager.logo,
                height: height * (186 / screenHeight),
              ),
              SizedBox(
                height: height * (24 / screenHeight),
              ),
              CustomTextField(
                hintText: AppLocalizations.of(context)!.email,
                hintStyle: AppStyle.medium16Grey,
                prefixIcon: Icon(
                  Icons.email,
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
              TextButton(
                onPressed: () {},
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "${AppLocalizations.of(context)!.forget_password} ?",
                    style: AppStyle.bold16PrimaryItalic.copyWith(
                        decoration: TextDecoration.underline,
                        decorationColor: AppColors.primaryLight),
                  ),
                ),
              ),
              SizedBox(
                height: height * (24 / screenHeight),
              ),
              CustomElevatedButton(
                onTab: login,
                text: AppLocalizations.of(context)!.login,
              ),
              SizedBox(
                height: height * (24 / screenHeight),
              ),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(children: [
                  TextSpan(
                      text:
                          "${AppLocalizations.of(context)!.dont_have_an_account}?",
                      style: AppStyle.medium16Black),
                  TextSpan(
                      text: AppLocalizations.of(context)!.create_account,
                      style: AppStyle.bold16PrimaryItalic.copyWith(
                        decoration: TextDecoration.underline,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.pushNamed(context, SignupScreen.routeName);
                        }),
                ]),
              ),
              SizedBox(
                height: height * (24 / screenHeight),
              ),
              Row(
                children: [
                  Expanded(
                    child: Divider(
                      color: AppColors.primaryLight,
                      endIndent: width * (16 / screenWidth),
                      indent: width * (42 / screenWidth),
                    ),
                  ),
                  Text(
                    AppLocalizations.of(context)!.or,
                    style: AppStyle.medium16Primary,
                  ),
                  Expanded(
                    child: Divider(
                        color: AppColors.primaryLight,
                        endIndent: width * (42 / screenWidth),
                        indent: width * (16 / screenWidth)),
                  ),
                ],
              ),
              SizedBox(
                height: height * (24 / screenHeight),
              ),
              CustomElevatedButton(
                  icon: ImageIcon(AssetImage(AssetsManager.iconGoogle)),
                  backgroundColor: AppColors.whiteColor,
                  text: AppLocalizations.of(context)!.login_with_google,
                  textStyle: AppStyle.medium20Primary,
                  onTab: () {})
            ],
          ),
        ),
      ),
    );
  }

  void login() {
    Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
  }
}
