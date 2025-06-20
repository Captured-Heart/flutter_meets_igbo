//pushNamed

// ignore_for_file: inference_failure_on_instance_creation, inference_failure_on_function_invocation

import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

void pushNamed(BuildContext context, String routeName, {Object? args}) => Navigator.pushNamed(context, routeName, arguments: args);
//push
Future<T?> push<T>(BuildContext context, Widget child) => Navigator.of(context).push<T>(MaterialPageRoute(builder: (_) => child));

//push_as_void
void pushAsVoid(BuildContext context, Widget child) => Navigator.of(context).push(MaterialPageRoute(builder: (context) => child));

//push_replacement
void pushReplacement(BuildContext context, Widget child) => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => child));
//push_replacement_named
void pushReplaceNamed(BuildContext context, String routeName, {Object? args}) => Navigator.pushReplacementNamed(context, routeName);
//pop until main
void popToMain(BuildContext context) => Navigator.of(context).popUntil((route) => route.isFirst);

//.ofContext POP
void pop(BuildContext context) => Navigator.of(context).pop();

void popAndPush(BuildContext context, String routeName) => Navigator.of(context).restorablePopAndPushNamed(routeName);

//.oFContext with rootNavigator POP
void popRootNavigatorTrue({required BuildContext context, required bool value}) => Navigator.of(context, rootNavigator: value).pop();

//.ofContext PUSH with root navigator == true
void pushReplacementOnRootNav(BuildContext context, Widget child) =>
    Navigator.of(context, rootNavigator: true).pushReplacement(MaterialPageRoute(builder: (context) => child));

void navBarPush({
  required BuildContext context,
  required Widget screen,
  required bool withNavBar,
  bool? popFirst = false,
  PageTransitionAnimation? pageTransitionsAnimation,
}) {
  popFirst == true ? pop(context) : null;
  PersistentNavBarNavigator.pushNewScreen(
    context,
    screen: screen,
    withNavBar: withNavBar,
    pageTransitionAnimation: pageTransitionsAnimation ?? PageTransitionAnimation.cupertino,
  );
}
