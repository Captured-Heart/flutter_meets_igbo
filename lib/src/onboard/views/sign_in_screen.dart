// ignore_for_file: implicit_call_tearoffs

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:igbo_flutter_locale_demo/config/constants/nav_routes.dart';
import 'package:igbo_flutter_locale_demo/config/constants/text_constants.dart';
import 'package:igbo_flutter_locale_demo/config/extensions/extensions.dart';
import 'package:igbo_flutter_locale_demo/config/theme/app_theme.dart';
import 'package:igbo_flutter_locale_demo/src/utils/navigation_helper.dart';
import 'package:igbo_flutter_locale_demo/src/widgets/app_loader.dart';
import 'package:igbo_flutter_locale_demo/src/widgets/textfield_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<StatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return FullScreenLoader(
      isLoading: false,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(TextConstant.loginToYourAccount.tr(), style: context.textTheme.headlineLarge),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    spacing: 5,
                    children: [
                      Flexible(child: Text(TextConstant.dontHaveAnAcct.tr())),
                      TextButton(
                        onPressed: () {
                          pushReplaceNamed(context, NavRoutes.createAccountScreenRoute);
                        },
                        child: Text(TextConstant.createAccount.tr()),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      AuthTextFieldWidget(
                        controller: TextEditingController(),

                        label: TextConstant.userName.tr(),
                        hintText: TextConstant.userName.tr(),
                        // validator: RequiredValidator(errorText: AuthErrors.requiredValue.errorMessage),
                      ),
                      AuthTextFieldWidget(
                        controller: TextEditingController(),

                        label: TextConstant.password.tr(),
                        hintText: TextConstant.passwordMustBe.tr(),
                        // validator: RequiredValidator(errorText: AuthErrors.requiredValue.errorMessage),
                      ),
                    ].columnInPadding(15),
                  ).padOnly(top: 10),
                ],
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    pushReplaceNamed(context, NavRoutes.mainScreenRoute);
                  },
                  child: Text(TextConstant.login.tr()),
                ),
              ),
            ],
          ).padSymmetric(horizontal: 20, vertical: 30),
        ),
      ),
    );
  }
}
