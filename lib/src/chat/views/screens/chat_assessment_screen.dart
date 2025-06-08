// ignore_for_file: omit_local_variable_types

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:igbo_flutter_locale_demo/config/constants/enums.dart';
import 'package:igbo_flutter_locale_demo/config/constants/icons.dart';
import 'package:igbo_flutter_locale_demo/config/constants/image_constants.dart';
import 'package:igbo_flutter_locale_demo/config/constants/text_constants.dart';
import 'package:igbo_flutter_locale_demo/config/extensions/extensions.dart';
import 'package:igbo_flutter_locale_demo/config/theme/app_theme.dart';
import 'package:igbo_flutter_locale_demo/src/chat/chat.dart';
import 'package:igbo_flutter_locale_demo/src/home/views/widgets/search_widget.dart';
import 'package:igbo_flutter_locale_demo/src/utils/shared_prefs.dart';
import 'package:igbo_flutter_locale_demo/src/widgets/textfield_widget.dart';

// import 'package:web_socket_channel/web_socket_channel.dart';

class ChatAssessmentScreen extends StatefulWidget {
  const ChatAssessmentScreen({super.key});

  @override
  State<StatefulWidget> createState() => _ChatAssessmentScreenState();
}

class _ChatAssessmentScreenState extends State<ChatAssessmentScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (context.mounted) {
        infoDialog();
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
        title: Text('Assessment', style: context.textTheme.bodyMedium, textScaleFactor: 1.2),
        actions: [
          CheckInfoBtn(
            onTap: () {
              SharedPreferencesHelper.removePref(SharedPrefKeys.assessmentDialog.name);
              infoDialog();
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
                spacing: 5,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  ActionBTNCard(icon: attachmentIcon),
                  Flexible(child: AuthTextFieldWidget(controller: TextEditingController(), hintText: TextConstant.typeSomething.tr())),
                  ActionBTNCard(icon: sendIcon, onTap: () {}),
                ],
              ).padSymmetric(horizontal: 5),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> infoDialog() {
    return checkIfShowDialog(
      context: context,
      prefKey: SharedPrefKeys.assessmentDialog.name,
      title: 'Info/Guide \n(Assessment Screen)',
      content: ListView(
        shrinkWrap: true,
        children: [
          Text(
            'In this screen, i implemented the web Socket Url, just like was assigned to me: \n\n ${SharedPreferencesHelper.getStringPref(SharedPrefKeys.tokenAccess.name)}\n',
          ),
          InteractiveViewer(
            child: Image.asset(ImageConstants.webSocketErrorPng, height: context.sizeHeight(0.15), width: double.infinity, fit: BoxFit.fill),
          ),
          const Text('\nAs seen in other screens, i implemented the websocket and got results'),
        ],
      ),
    );
  }
}
