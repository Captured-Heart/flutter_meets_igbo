import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:igbo_flutter_locale_demo/config/constants/icons.dart';
import 'package:igbo_flutter_locale_demo/config/constants/text_constants.dart';
import 'package:igbo_flutter_locale_demo/config/extensions/extensions.dart';
import 'package:igbo_flutter_locale_demo/config/theme/app_border_radius.dart';
import 'package:igbo_flutter_locale_demo/config/theme/app_theme.dart';
import 'package:igbo_flutter_locale_demo/config/theme/igbo_locale_color.dart';
import 'package:igbo_flutter_locale_demo/config/theme/text_theme.dart';

class SearchWidgetRow extends StatelessWidget {
  const SearchWidgetRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: TextField(
            decoration: InputDecoration(
              fillColor: IgboLocaleColor.indicatorInactiveColor,
              hintText: TextConstant.search.tr(),
              hintStyle: AppTextStyle.bodyMedium,
              prefixIcon: Icon(searchIcon),
              border: borderDesign(),
              disabledBorder: borderDesign(),
              enabledBorder: borderDesign(),
            ),
          ),
        ),
        ActionBTNCard(),
      ],
    );
  }
}

class ActionBTNCard extends StatelessWidget {
  final IconData? icon;
  final VoidCallback? onTap;

  const ActionBTNCard({super.key, this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        shape: const RoundedRectangleBorder(borderRadius: AppBorderRadius.c12),
        color: context.theme.primaryColor,
        child: Icon(icon ?? filterIcon, color: context.theme.scaffoldBackgroundColor).padAll(10),
      ),
    );
  }
}

OutlineInputBorder borderDesign() => const OutlineInputBorder(borderRadius: AppBorderRadius.c12);
