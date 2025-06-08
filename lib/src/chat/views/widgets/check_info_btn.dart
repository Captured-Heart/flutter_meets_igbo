import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:igbo_flutter_locale_demo/config/constants/icons.dart';
import 'package:igbo_flutter_locale_demo/config/constants/text_constants.dart';
import 'package:igbo_flutter_locale_demo/config/extensions/extensions.dart';
import 'package:igbo_flutter_locale_demo/config/theme/app_border_radius.dart';
import 'package:igbo_flutter_locale_demo/config/theme/igbo_locale_color.dart';

class CheckInfoBtn extends StatelessWidget {
  final VoidCallback onTap;

  const CheckInfoBtn({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        shape: const RoundedRectangleBorder(side: BorderSide(color: IgboLocaleColor.amberColor), borderRadius: AppBorderRadius.c12),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [const Icon(warningIcon, color: IgboLocaleColor.amberColor), Text(TextConstant.checkInfo.tr())],
        ).padAll(5),
      ),
    );
  }
}
