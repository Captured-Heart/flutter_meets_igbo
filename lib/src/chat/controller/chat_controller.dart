import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_meets_igbo/config/constants/text_constants.dart';

class ChatController extends ChangeNotifier {
  String igboCultureStory = '';
  L10nEnum? l10nEnum;

  void setL10nEnum(L10nEnum? value, {required BuildContext context}) {
    l10nEnum = value;
    if (value != null) {
      context.setLocale(value.locale);
    }

    getStory(languageCode: value?.locale.languageCode ?? 'en');
    notifyListeners();
  }

  void getStory({String languageCode = 'en'}) async {
    log('this  language code: $languageCode');
    String story = await rootBundle.loadString('assets/story/igbo_culture_story_$languageCode.html');

    if (story.isNotEmpty) {
      igboCultureStory = story;
      notifyListeners();
    } else {
      log('Failed to load story for language code: $languageCode');
    }
  }
}
