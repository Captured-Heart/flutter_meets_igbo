// ignore_for_file: inference_failure_on_function_invocation

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:igbo_flutter_locale_demo/config/constants/text_constants.dart';
import 'package:igbo_flutter_locale_demo/config/extensions/extensions.dart';
import 'package:igbo_flutter_locale_demo/config/theme/theme.dart';
import 'package:igbo_flutter_locale_demo/src/utils/navigation_helper.dart';
import 'package:igbo_flutter_locale_demo/src/widgets/cache_network_image_widget.dart';

final GlobalKey<ScaffoldMessengerState> rootScaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

void showScaffoldSnackBar(SnackBar snackBar) => rootScaffoldMessengerKey.currentState?.showSnackBar(snackBar);

void showScaffoldSnackBarMessage(String message, {bool isError = false, int? duration}) => rootScaffoldMessengerKey.currentState?.showSnackBar(
  SnackBar(
    content: Row(
      spacing: 5,
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(isError ? Icons.cancel : Icons.check_circle, color: isError ? IgboLocaleColor.textError : IgboLocaleColor.success),
        Expanded(child: Text(message, textAlign: TextAlign.left)),
      ],
    ),
    duration: Duration(seconds: duration ?? 2),
  ),
);

void warningDialogs({
  required BuildContext context,
  required String errorMessage,
  VoidCallback? onNegativeAction,
  required VoidCallback onPostiveAction,
  bool hasImage = false,
  String? imgUrl,
  double? height,
  String? title,
}) => showDialog(
  context: context,
  builder: (context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      titleTextStyle: context.textTheme.bodyLarge,
      title: Text(title ?? 'Error', textScaleFactor: 1.1, textAlign: TextAlign.center).padOnly(bottom: 10),
      content: Row(
        spacing: 10,
        children: [
          if (hasImage == false) const SizedBox.shrink() else CachedNetworkImageWidget(imgUrl: imgUrl, height: height ?? 80),
          Expanded(child: Text(errorMessage, textScaleFactor: 1.1, textAlign: hasImage == true ? TextAlign.left : TextAlign.center)),
        ],
      ).padSymmetric(horizontal: 15),
      contentPadding: const EdgeInsets.only(top: 5),
      actionsAlignment: MainAxisAlignment.spaceAround,
      contentTextStyle: context.theme.textTheme.bodyMedium,
      // actionsPadding: EdgeInsets.zero,
      actions: [
        TextButton(
          onPressed:
              onNegativeAction ??
              () {
                pop(context);
              },
          style: TextButton.styleFrom(foregroundColor: IgboLocaleColor.textError),
          child: Text(TextConstant.cancel.tr()),
        ),
        TextButton(onPressed: onPostiveAction, child: Text(TextConstant.confirm.tr())),
      ],
    );
  },
);

//
Future<void> showAuthBottomSheet({required BuildContext context, String? errorMessage}) async {
  await showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))),
    builder:
        (context1) => Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          spacing: 20,
          children: [
            const Icon(Icons.cancel, color: IgboLocaleColor.textError, size: 44),
            ListTile(
              title: const Text('Error', textScaleFactor: 1.1, textAlign: TextAlign.center).padOnly(bottom: 10),
              subtitle: Text(
                errorMessage ?? 'check network',
                // 'invalid phone number/password combination',
                textScaleFactor: 1.1,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ).padSymmetric(vertical: 40, horizontal: 30),
  );
}
