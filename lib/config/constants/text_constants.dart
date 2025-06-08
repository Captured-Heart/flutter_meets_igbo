import 'package:flutter/material.dart';

// class L10n {
//   static final all = [const Locale('en', 'US'), const Locale('es', 'ES'), const Locale('ig', 'NG')];

//   static String getFlag(String locale) {
//     switch (locale) {
//       case 'US':
//         return '🇺🇸';
//       case 'ES':
//         return '🇪🇸';
//       case 'NG':
//         return '🇳🇬';
//       default:
//         return '🇺🇸';
//     }
//   }

//   static String getLang(String locale) {
//     switch (locale) {
//       case 'US':
//         return ' English';
//       case 'ES':
//         return ' Spanish';
//       default:
//         return ' English';
//     }
//   }
// }

enum L10nEnum {
  enUS('🇺🇸', 'English', Locale('en', 'US')),
  esES('🇪🇸', 'Spanish', Locale('es', 'ES')),
  igNG('🇳🇬', 'Igbo', Locale('ig', 'NG'));

  const L10nEnum(this.flag, this.lang, this.locale);
  final String flag;
  final String lang;
  final Locale locale;
  static L10nEnum fromLocale(Locale locale) {
    return L10nEnum.values.firstWhere(
      (e) => e.locale.languageCode == locale.languageCode && e.locale.countryCode == locale.countryCode,
      orElse: () => L10nEnum.enUS,
    );
  }
}

abstract class TextConstant {
  //
  static const appTitle = 'Igbo Flutter Locale Demo';

  /*----------------------------------------------------------------------
          SIGN UP SCREEN
-----------------------------------------------------------------------*/
  static const createYourAcct = 'createYourAcct';
  static const haveAnAcct = "haveAnAcct";
  static const login = 'login';
  static const firstName = 'firstName';
  static const enterFullNameAsWritten = 'enterFullNameAsWritten';
  static const lastName = 'lastName';
  static const userName = 'userName';
  static const emailAddress = 'emailAddress';
  static const password = 'password';
  static const emailHint = 'emailHint';
  static const confirmPassword = 'confirmPassword';
  static const createAccount = 'createAccount';
  static const passwordMustBe = 'passwordMustBe';
  static const loginToYourAccount = 'loginToYourAccount';
  static const dontHaveAnAcct = "dontHaveAnAcct";

  static const hello = 'hello';
  static const signOut = 'signOut';
  static const search = 'search';
  static const popularItems = 'popularItems';
  static const viewAll = 'viewAll';
  static const getYourSpecialSale = 'getYourSpecialSale';
  static const shopNow = 'shopNow';
  static const all = 'all';
  static const fashion = 'fashion';
  static const sport = 'sport';
  static const phones = 'phones';
  static const electronics = 'electronics';
  static const fashionableShorts = 'fashionableShorts';
  static const home = 'home';
  static const chat = 'chat';
  static const searchMessages = 'searchMessages';
  static const typeSomething = 'typeSomething';
  static const cancel = 'cancel';
  static const confirm = 'confirm';
  static const location = 'location';
  static const profile = 'profile';
  static String getFullName() {
    return 'Nkpozi Marcel Kelechi';
  }

  static const settings = 'settings';
  static const dark = 'dark';
  static const light = 'light';
  static const theme = 'theme';
  static const locale = 'locale';
  static const areYouSureYouWantToLogOut = 'areYouSureYouWantToLogOut';
  static const testingTheAssessment = 'testingTheAssessment';
  static const testingTheCoinbase = 'testingTheCoinbase';
  static const checkInfo = 'checkInfo';
  static const inThisScreenIImplemented = 'inThisScreenIImplemented';
  static const forWord = 'forWord';
  static const itsAnEchoWebsocket = 'itsAnEchoWebsocket';
  static const usingTheSameMethod = 'usingTheSameMethod';
  static const hereWeCanPassAMessage = 'hereWeCanPassAMessage';
  static const infoGuide = 'infoGuide';
  static const toTestThisWebsocket = 'toTestThisWebsocket';
  static const ignoreUsingTheTextField = 'ignoreUsingTheTextField';
  static const thisParticularEvent = 'thisParticularEvent';
  static const theEventPassedToTheCoinbase = 'theEventPassedToTheCoinbase';
  static const youCanCheckLine = 'youCanCheckLine';
  static const theIgboHeritage = 'theIgboHeritage';
}
