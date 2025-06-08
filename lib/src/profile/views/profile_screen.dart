import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:igbo_flutter_locale_demo/config/constants/enums.dart';
import 'package:igbo_flutter_locale_demo/config/constants/icons.dart';
import 'package:igbo_flutter_locale_demo/config/constants/image_constants.dart';
import 'package:igbo_flutter_locale_demo/config/constants/text_constants.dart';
import 'package:igbo_flutter_locale_demo/config/extensions/extensions.dart';
import 'package:igbo_flutter_locale_demo/config/theme/app_border_radius.dart';
import 'package:igbo_flutter_locale_demo/config/theme/app_style.dart';
import 'package:igbo_flutter_locale_demo/config/theme/app_theme.dart';
import 'package:igbo_flutter_locale_demo/config/theme/igbo_locale_color.dart';
import 'package:igbo_flutter_locale_demo/main.dart';
import 'package:igbo_flutter_locale_demo/src/home/provider/home_controller.dart';
import 'package:igbo_flutter_locale_demo/src/onboard/views/sign_in_screen.dart';
import 'package:igbo_flutter_locale_demo/src/utils/navigation_helper.dart';
import 'package:igbo_flutter_locale_demo/src/utils/shared_prefs.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});
  final faker = Faker();

  @override
  Widget build(BuildContext context) {
    final themeContext = Theme.of(context);
    return Scaffold(
      body: Stack(
        children: [
          Container(decoration: const BoxDecoration(image: DecorationImage(image: AssetImage(ImageConstants.imgPlaceholder2), fit: BoxFit.fill))),

          // THE CIRCLE AVATAR IMAGE
          Positioned(
            top: context.sizeHeight(0.1),
            width: context.sizeWidth(1),
            child: Column(
              children: [
                CircleAvatar(radius: context.sizeWidth(0.17), backgroundImage: NetworkImage(faker.image.loremPicsum(), scale: 0.6)),
                Text(TextConstant.getFullName(), style: context.textTheme.headlineLarge?.copyWith(color: IgboLocaleColor.textFieldBorder)),
              ],
            ),
          ),

          // THE WHITE CONTAINER IN THIS SCREEN
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: context.sizeHeight(0.55),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40)),
                  color: context.theme.scaffoldBackgroundColor,
                ),
                child: SafeArea(
                  minimum: AppEdgeInsets.eH16,
                  child: ListenableBuilder(
                    listenable: Listenable.merge([homeController]),
                    builder: (context, _) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(TextConstant.settings.tr().toTitleCase(), style: context.textTheme.bodyLarge, textScaleFactor: 1.3),

                          // THEME BUTTON
                          GestureDetector(
                            child: Card(child: ListTile(title: Text(TextConstant.theme.tr().toTitleCase()), leading: const Icon(nightIcon))),
                          ),

                          //LOCALE
                          GestureDetector(
                            onTap: () {
                              homeController.setHideNavBar(true);

                              Timer(const Duration(milliseconds: 500), () {
                                changeLocaleModal(context, themeContext, homeController);
                              });
                            },
                            child: Card(child: ListTile(title: Text(TextConstant.locale.tr().toTitleCase()), leading: const Icon(nightIcon))),
                          ),

                          /// SIGN OUT BUTTON
                          GestureDetector(
                            onTap: () {
                              homeController.setBottomNavIndex(0);

                              SharedPreferencesHelper.removePref(SharedPrefKeys.tokenAccess.name);
                              pushReplacementOnRootNav(context, const LoginScreen());
                            },
                            child: Card(
                              child: ListTile(
                                title: Text(
                                  TextConstant.signOut.tr(),
                                  style: context.textTheme.labelSmall?.copyWith(fontWeight: AppFontWeight.w600),
                                  textScaleFactor: 1.5,
                                ),
                                leading: const Icon(logOutIcon, color: IgboLocaleColor.textError),
                              ),
                            ),
                          ),
                        ].columnInPadding(15),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> changeLocaleModal(BuildContext context, ThemeData themeContext, HomeController homeController) {
    return showModalBottomSheet(
      context: context,
      isDismissible: false,
      elevation: 4,
      backgroundColor: themeContext.scaffoldBackgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: const BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        side: BorderSide(color: themeContext.primaryColor, width: 0.2),
      ),
      builder:
          (context) => ListenableBuilder(
            listenable: Listenable.merge([homeController]),
            builder: (context, _) {
              return Container(
                // height: size.height * 0.2,
                margin: EdgeInsets.symmetric(horizontal: context.sizeWidth(0.1)),
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children:
                      context.supportedLocales.map((locale) {
                        final L10nEnum localeEnum = L10nEnum.fromLocale(locale);
                        final flag = localeEnum.flag;
                        final lang = localeEnum.lang;

                        return ListTile(
                          onTap: () {
                            homeController.setHideNavBar(false);
                            context.setLocale(locale);
                            chatController.setL10nEnum(localeEnum, context: context);
                            pop(context);
                          },
                          contentPadding: const EdgeInsets.symmetric(vertical: 5),
                          leading: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: themeContext.scaffoldBackgroundColor,
                              border: Border.all(color: themeContext.primaryColor),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(flag, textScaleFactor: 1.6),
                          ),
                          title: Text(lang, textAlign: TextAlign.start, textScaleFactor: 1.3),
                        );
                      }).toList(),
                ),
              );
            },
          ),
    );
  }
}
