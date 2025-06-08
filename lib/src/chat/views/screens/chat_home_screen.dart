import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:flutter_meets_igbo/config/constants/image_constants.dart';
import 'package:flutter_meets_igbo/config/constants/text_constants.dart';
import 'package:flutter_meets_igbo/config/extensions/extensions.dart';
import 'package:flutter_meets_igbo/config/theme/app_theme.dart';
import 'package:flutter_meets_igbo/main.dart';

class ChatHomeScreen extends StatefulWidget {
  const ChatHomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => _ChatHomeScreenState();
}

class _ChatHomeScreenState extends State<ChatHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        forceMaterialTransparency: true,
        scrolledUnderElevation: 0,
        centerTitle: false,
        // leading: const BackButton(),
        title: Row(
          spacing: 5,
          children: [
            DecoratedBox(
              decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all()),
              child: Center(child: Image.asset(ImageConstants.appLogo, width: 30, height: 30)),
            ),
            Flexible(
              child: Text(
                TextConstant.theIgboHeritage.tr(),
                style: context.textTheme.bodyLarge,
                textScaleFactor: 1.2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        actions: [
          DropdownButton<L10nEnum>(
            value: chatController.l10nEnum ?? L10nEnum.fromLocale(context.locale),
            underline: SizedBox(),
            onChanged: (L10nEnum? newValue) {
              if (newValue != null) {
                chatController.setL10nEnum(newValue, context: context);
              }
            },
            items:
                L10nEnum.values.map((L10nEnum value) {
                  return DropdownMenuItem<L10nEnum>(
                    value: value,
                    child: Row(
                      spacing: 10,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CircleAvatar(radius: 15, child: Center(child: Text(value.flag, style: TextStyle(fontSize: 20)))),
                        Text(value.lang.trim()),
                      ],
                    ),
                  );
                }).toList(),
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        shrinkWrap: true,
        children: [
          ListenableBuilder(
            listenable: chatController,
            builder: (context, _) {
              return HtmlWidget(chatController.igboCultureStory);
            },
          ),
        ].columnInPadding(5),
      ),
    );
  }
}
