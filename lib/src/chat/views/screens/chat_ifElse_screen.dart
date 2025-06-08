// ignore_for_file: omit_local_variable_types

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meets_igbo/config/constants/enums.dart';
import 'package:flutter_meets_igbo/config/constants/icons.dart';
import 'package:flutter_meets_igbo/config/constants/text_constants.dart';
import 'package:flutter_meets_igbo/config/extensions/extensions.dart';
import 'package:flutter_meets_igbo/config/theme/app_theme.dart';
import 'package:flutter_meets_igbo/src/chat/chat.dart';
import 'package:flutter_meets_igbo/src/home/views/widgets/widgets.dart';
import 'package:flutter_meets_igbo/src/utils/shared_prefs.dart';
import 'package:flutter_meets_igbo/src/widgets/textfield_widget.dart';

class ChatIfElseScreen extends StatefulWidget {
  const ChatIfElseScreen({super.key});

  @override
  State<StatefulWidget> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatIfElseScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (context.mounted) {
        ifElseDialog();
      }
    });
    super.initState();
  }

  List<String> listOfMessages = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        centerTitle: true,
        title: Text('IfElse.Io', style: context.textTheme.bodyMedium, textScaleFactor: 1.2),
        actions: [
          CheckInfoBtn(
            onTap: () {
              SharedPreferencesHelper.removePref(SharedPrefKeys.ifElseDialog.name);
              ifElseDialog();
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

  Future<void> ifElseDialog() {
    return checkIfShowDialog(
      context: context,
      prefKey: SharedPrefKeys.ifElseDialog.name,
      title: '${TextConstant.infoGuide.tr()} \n(IfElse.io Screen)',
      content: ListView(
        shrinkWrap: true,
        children: [
          Text(
            '${TextConstant.inThisScreenIImplemented.tr()}, \n=> ${TextConstant.forWord.tr()} ifElse.io (${TextConstant.itsAnEchoWebsocket.tr()}): \n *** wss://ws.ifelse.io \n\n => ${TextConstant.usingTheSameMethod.tr()}\n',
          ),
          Text(TextConstant.hereWeCanPassAMessage.tr()),
          Center(child: ActionBTNCard(icon: sendIcon)),
        ],
      ),
    );
  }
}
