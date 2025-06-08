// ignore_for_file: omit_local_variable_types

import 'dart:convert';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:igbo_flutter_locale_demo/config/constants/enums.dart';
import 'package:igbo_flutter_locale_demo/config/constants/icons.dart';
import 'package:igbo_flutter_locale_demo/config/constants/text_constants.dart';
import 'package:igbo_flutter_locale_demo/config/extensions/extensions.dart';
import 'package:igbo_flutter_locale_demo/config/theme/app_theme.dart';
import 'package:igbo_flutter_locale_demo/src/chat/chat.dart';
import 'package:igbo_flutter_locale_demo/src/home/views/widgets/widgets.dart';
import 'package:igbo_flutter_locale_demo/src/utils/shared_prefs.dart';
import 'package:igbo_flutter_locale_demo/src/widgets/textfield_widget.dart';

class ChatCoinsScreen extends StatefulWidget {
  const ChatCoinsScreen({super.key});

  @override
  State<StatefulWidget> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatCoinsScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (context.mounted) {
        coinInfoDialog();
      }
    });
    super.initState();
  }

  List<String> listOfMessages = [];
  String btcEvent() {
    return jsonEncode({
      "type": "subscribe",
      "channels": [
        {
          "name": "ticker",
          "product_ids": ["BTC-EUR"],
        },
      ],
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        centerTitle: true,
        title: Text('Coinbase', style: context.textTheme.bodyMedium, textScaleFactor: 1.2),
        actions: [
          CheckInfoBtn(
            onTap: () {
              SharedPreferencesHelper.removePref(SharedPrefKeys.coinbaseDialog.name);
              coinInfoDialog();
            },
          ),
        ].rowInPadding(10),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: double.infinity,
              // height: 100,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  ActionBTNCard(icon: attachmentIcon),
                  Flexible(child: AuthTextFieldWidget(controller: TextEditingController(), hintText: TextConstant.typeSomething.tr())),
                  ActionBTNCard(icon: sendIcon, onTap: () {}),
                ].rowInPadding(5),
              ).padSymmetric(horizontal: 5),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> coinInfoDialog() {
    return checkIfShowDialog(
      context: context,
      prefKey: SharedPrefKeys.coinbaseDialog.name,
      title: '${TextConstant.infoGuide.tr()} \n(Coinbase)',
      content: ListView(
        shrinkWrap: true,
        children: [
          Text(
            '${TextConstant.inThisScreenIImplemented.tr()}, ${TextConstant.forWord.tr()} Coinbase: \n *** wss://ws-feed.pro.coinbase.com \n\n => ${TextConstant.usingTheSameMethod.tr()}\n',
          ),
          Text(
            '=> ${TextConstant.toTestThisWebsocket.tr()}\n(${TextConstant.ignoreUsingTheTextField.tr()})\n. ${TextConstant.thisParticularEvent.tr()}',
          ),
          Center(child: ActionBTNCard(icon: sendIcon)),
          Text(
            '=> ${TextConstant.theEventPassedToTheCoinbase.tr()} : \n **${btcEvent()} \n **(${TextConstant.youCanCheckLine.tr()} 65-80 in "lib/src/chat/views/screens/chat_coins_screen.dart" on Github)**\n',
          ),
        ],
      ),
    );
  }
}
