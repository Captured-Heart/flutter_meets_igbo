import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:igbo_flutter_locale_demo/config/constants/icons.dart';
import 'package:igbo_flutter_locale_demo/config/extensions/extensions.dart';
import 'package:igbo_flutter_locale_demo/config/theme/app_theme.dart';
import 'package:igbo_flutter_locale_demo/config/theme/igbo_locale_color.dart';

Row chatBubbleWidget(BuildContext context, {required bool fromUser, String? text, int? index, required Faker faker}) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.end,
    mainAxisAlignment: index!.isEven ? MainAxisAlignment.end : MainAxisAlignment.start,
    children: [
      Column(
        spacing: 5,
        // crossAxisAlignment: CrossAxisAlignment.end,
        children: [const Icon(doubleCheck, size: 16), const Text('14:22')],
      ),
      Padding(
        padding: const EdgeInsets.all(6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(
              width: context.sizeWidth(0.6),
              child: Card(
                elevation: 1,
                // color: index!.isEven ? context.theme.primaryColor : LearnGualColor.textHint,
                shape: RoundedRectangleBorder(
                  side: const BorderSide(color: Colors.white, width: 0.5),
                  borderRadius: BorderRadius.only(
                    topLeft: const Radius.circular(10),
                    topRight: const Radius.circular(10),
                    bottomLeft: Radius.circular(index.isEven ? 10 : 0),
                    bottomRight: Radius.circular(index.isEven ? 0 : 10),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    text ?? faker.lorem.sentences(4).toString(),
                    style: context.textTheme.bodyMedium?.copyWith(
                      color: fromUser == true ? IgboLocaleColor.textDark : context.textTheme.bodyMedium!.color,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
