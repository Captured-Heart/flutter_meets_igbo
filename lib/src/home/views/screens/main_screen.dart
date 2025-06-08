// ignore_for_file: omit_local_variable_types

import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:igbo_flutter_locale_demo/config/constants/icons.dart';
import 'package:igbo_flutter_locale_demo/config/constants/text_constants.dart';
import 'package:igbo_flutter_locale_demo/config/theme/app_style.dart';
import 'package:igbo_flutter_locale_demo/config/theme/app_theme.dart';
import 'package:igbo_flutter_locale_demo/config/theme/igbo_locale_color.dart';
import 'package:igbo_flutter_locale_demo/main.dart';
import 'package:igbo_flutter_locale_demo/src/chat/chat.dart';
import 'package:igbo_flutter_locale_demo/src/home/views/screens/home_screen.dart';
import 'package:igbo_flutter_locale_demo/src/location/location.dart';
import 'package:igbo_flutter_locale_demo/src/profile/views/profile_screen.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<StatefulWidget> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    super.initState();
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: ListenableBuilder(
        listenable: homeController,

        builder: (context, _) {
          return PersistentTabView(
            context,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            controller: homeController.persistentTabController,
            navBarStyle: NavBarStyle.style7,
            navBarHeight: kBottomNavigationBarHeight * 1.2,
            hideNavigationBarWhenKeyboardAppears: true,
            popBehaviorOnSelectedNavBarItemPress: PopBehavior.all,
            confineToSafeArea: true,
            isVisible: !homeController.hideNavBar,
            backgroundColor: context.theme.scaffoldBackgroundColor,
            onItemSelected: (value) {
              log(value.toString());
              homeController.setBottomNavIndex(value);
            },
            items: navBarsItems(context: context),
            screens: [HomeScreen(), ChatHomeScreen(), LocationScreen(), ProfileScreen()],
            decoration: const NavBarDecoration(
              // borderRadius: BorderRadius.circular(10.0),
              colorBehindNavBar: Colors.black,
              boxShadow: [BoxShadow(color: IgboLocaleColorLight.textLight, blurRadius: 1, spreadRadius: 0.5)],
            ),
          );
        },
      ),
    );
  }
}

List<PersistentBottomNavBarItem> navBarsItems({required BuildContext context}) {
  TextStyle itemTextStyle = context.theme.textTheme.bodyMedium!.copyWith(fontWeight: AppFontWeight.w700);
  return [
    PersistentBottomNavBarItem(
      textStyle: itemTextStyle,
      icon: const Icon(homeIcon), //cottage_outlined
      title: TextConstant.home.tr(),
      iconSize: 24,
      activeColorPrimary: context.theme.primaryColor,
      inactiveColorPrimary: IgboLocaleColorLight.textHint,
      activeColorSecondary: context.theme.scaffoldBackgroundColor,
    ),
    PersistentBottomNavBarItem(
      textStyle: itemTextStyle,
      icon: const Icon(mailIcon),
      title: TextConstant.chat.tr(),
      iconSize: 24,
      activeColorPrimary: context.theme.primaryColor,
      inactiveColorPrimary: IgboLocaleColorLight.textHint,
      activeColorSecondary: context.theme.scaffoldBackgroundColor,
    ),
    PersistentBottomNavBarItem(
      textStyle: itemTextStyle,
      icon: const Icon(locationIcon),
      iconSize: 25,
      title: TextConstant.location.tr(),
      activeColorPrimary: context.theme.primaryColor,
      inactiveColorPrimary: IgboLocaleColorLight.textHint,
      activeColorSecondary: context.theme.scaffoldBackgroundColor,
    ),
    PersistentBottomNavBarItem(
      textStyle: itemTextStyle,
      icon: const Icon(personIcon),
      title: TextConstant.profile.tr(),
      iconSize: 28,
      activeColorPrimary: context.theme.primaryColor,
      inactiveColorPrimary: IgboLocaleColorLight.textHint,
      activeColorSecondary: context.theme.scaffoldBackgroundColor,
    ),
  ];
}
