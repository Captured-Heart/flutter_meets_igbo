// ignore_for_file: implicit_call_tearoffs

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meets_igbo/config/constants/nav_routes.dart';
import 'package:flutter_meets_igbo/config/constants/text_constants.dart';
import 'package:flutter_meets_igbo/config/extensions/extensions.dart';
import 'package:flutter_meets_igbo/config/theme/app_theme.dart';
import 'package:flutter_meets_igbo/src/utils/navigation_helper.dart';
import 'package:flutter_meets_igbo/src/widgets/app_loader.dart';
import 'package:flutter_meets_igbo/src/widgets/textfield_widget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<StatefulWidget> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return FullScreenLoader(
      isLoading: false,
      child: Scaffold(
        body: ListView(
          // padding: AppEdgeInsets.eA20,
          children: [
            Text(TextConstant.createYourAcct.tr(), style: context.textTheme.headlineLarge),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(child: Text(TextConstant.haveAnAcct.tr())),
                TextButton(
                  onPressed: () {
                    pushReplaceNamed(context, NavRoutes.loginScreenRoute);
                  },
                  child: Text(TextConstant.login.tr()),
                ),
              ],
            ),
            Column(
              spacing: 15,
              children: [
                AuthTextFieldWidget(
                  controller: TextEditingController(),

                  label: TextConstant.firstName.tr(),
                  hintText: TextConstant.enterFullNameAsWritten.tr(),
                  // validator: RequiredValidator(errorText: AuthErrors.requiredValue.errorMessage),
                ),
                AuthTextFieldWidget(
                  controller: TextEditingController(),

                  label: TextConstant.lastName.tr(),
                  hintText: TextConstant.enterFullNameAsWritten.tr(),
                  // validator: RequiredValidator(errorText: AuthErrors.requiredValue.errorMessage),
                ),
                AuthTextFieldWidget(
                  controller: TextEditingController(),

                  label: TextConstant.userName.tr(),
                  hintText: TextConstant.enterFullNameAsWritten.tr(),
                  // validator: RequiredValidator(errorText: AuthErrors.requiredValue.errorMessage),
                ),
                AuthTextFieldWidget(
                  controller: TextEditingController(),

                  label: TextConstant.emailAddress.tr(),
                  hintText: TextConstant.emailHint.tr(),
                  // validator: MultiValidator([
                  //   RequiredValidator(errorText: AuthErrors.requiredValue.errorMessage),
                  //   EmailValidator(errorText: AuthErrors.provideAWorkingEmail.errorMessage),
                  // ]),
                ),
                AuthTextFieldWidget(
                  controller: TextEditingController(),

                  label: TextConstant.password.tr(),
                  hintText: TextConstant.password.tr(),
                  // validator: MultiValidator([
                  //   RequiredValidator(errorText: AuthErrors.requiredValue.errorMessage),
                  //   MinLengthValidator(8, errorText: AuthErrors.passwordMustBeAtleast.errorMessage),
                  // ]),
                ),
                AuthTextFieldWidget(
                  controller: TextEditingController(),

                  label: TextConstant.confirmPassword.tr(),
                  hintText: TextConstant.password.tr(),
                  // validator:
                  //     (value) => MatchValidator(
                  //       errorText: AuthErrors.passwordDoesNotMatch.errorMessage,
                  //     ).validateMatch(TextEditingController().text, TextEditingController()2.text),
                ),
                SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () {}, child: Text(TextConstant.createAccount.tr()))),
              ],
            ),
          ],
        ).padAll(20),
      ),
    );
  }
}
