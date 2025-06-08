import 'package:easy_localization/easy_localization.dart' as intl;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class IgboMaterialLocalizations extends DefaultMaterialLocalizations {
  @override
  String get openAppDrawerTooltip => 'Mepee drawer nnabata';

  @override
  String get backButtonTooltip => 'Azụ';

  @override
  String get closeButtonTooltip => 'Mechie';

  @override
  String get deleteButtonTooltip => 'Hichapụ';

  @override
  String get nextMonthTooltip => 'Ọnwa na-esote';

  @override
  String get previousMonthTooltip => 'Ọnwa gara aga';

  @override
  String get nextPageTooltip => 'Ibe na-esote';

  @override
  String get previousPageTooltip => 'Ibe gara aga';

  @override
  String get showMenuTooltip => 'Gosi menu';

  @override
  String get cancelButtonLabel => 'Kagbuo';

  @override
  String get closeButtonLabel => 'Mmechi';

  @override
  String get continueButtonLabel => 'Gaa n\'ihu';

  @override
  String get copyButtonLabel => 'Detuo';

  @override
  String get cutButtonLabel => 'Bipụ';

  @override
  String get okButtonLabel => 'OK';

  @override
  String get pasteButtonLabel => 'Mado';

  @override
  String get selectAllButtonLabel => 'Họrọ Ha Niile';

  @override
  String get viewLicensesButtonLabel => 'Lelee Akwụkwọ Ikike';

  @override
  String get anteMeridiemAbbreviation => 'ỤTỤTỤ';

  @override
  String get postMeridiemAbbreviation => 'EFIFI';

  @override
  String get selectYearSemanticsLabel => 'Họrọ afọ';

  @override
  String get alertDialogLabel => 'Ngosi';

  @override
  String get rowsPerPageTitle => 'Ahịrị n\'otu ibe:';

  @override
  String get keyboardKeyAlt => 'Alt';

  @override
  String get keyboardKeyShift => 'Shift';

  @override
  String get menuBarMenuLabel => 'Ogwe menu';

  @override
  String get scrimLabel => 'Ihe mkpuchi';

  @override
  @override
  String get expansionTileExpandedHint => 'pịnye ugboro abụọ iji mechie';

  @override
  String get expansionTileCollapsedHint => 'pịnye ugboro abụọ iji gbasaa';

  @override
  String get signedInLabel => 'Abanyela';

  @override
  String get showAccountsLabel => 'Gosi akaụntụ';

  @override
  String get hideAccountsLabel => 'Zoo akaụntụ';

  @override
  String formatMonthYear(DateTime date) => intl.DateFormat.yMMMM('ig').format(date);

  @override
  String formatShortMonthDay(DateTime date) => intl.DateFormat.Md('ig').format(date);

  @override
  String formatYear(DateTime date) => intl.DateFormat.y('ig').format(date);

  @override
  String get calendarModeButtonLabel => 'Gbanwee gaa na kalenda';

  @override
  String get dateHelpText => 'mm/dd/yyyy';

  @override
  String get dateInputLabel => 'Tinye ụbọchị';

  @override
  String get dateOutOfRangeLabel => 'Nọ n\'ọrụ.';

  @override
  String get dateRangeEndLabel => 'Ụbọchị njedebe';

  @override
  String get dateRangePickerHelpText => 'Họrọ Ogologo Oge';

  @override
  String get dateRangeStartLabel => 'Ụbọchị mmalite';

  @override
  String get invalidDateFormatLabel => 'Usoro ụbọchị ezighi ezi.';

  @override
  String get timePickerDialHelpText => 'Họrọ oge';

  @override
  String get timePickerHourLabel => 'Elekere';

  @override
  String get timePickerInputHelpText => 'Tinye oge';

  @override
  String get timePickerMinuteLabel => 'Nkeji';

  @override
  String get timePickerHourModeAnnouncement => 'Họrọ awa';

  @override
  String get timePickerMinuteModeAnnouncement => 'Họrọ nkeji';

  @override
  String get licensesPageTitle => 'Akwụkwọ ikike';

  @override
  List<String> get narrowWeekdays => ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];

  @override
  int get firstDayOfWeekIndex => 0;

  static const LocalizationsDelegate<MaterialLocalizations> delegate = _IgboMaterialLocalizationsDelegate();

  @override
  String get saveButtonLabel => 'Chekwa';
}

class _IgboMaterialLocalizationsDelegate extends LocalizationsDelegate<MaterialLocalizations> {
  const _IgboMaterialLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => locale.languageCode == 'ig';

  @override
  Future<MaterialLocalizations> load(Locale locale) async => IgboMaterialLocalizations();

  @override
  bool shouldReload(_IgboMaterialLocalizationsDelegate old) => false;
}

class IgboWidgetsLocalizations implements WidgetsLocalizations {
  const IgboWidgetsLocalizations();

  @override
  TextDirection get textDirection => TextDirection.ltr;

  // Add more overrides here as needed, for example:
  // @override
  // String get okButtonLabel => 'Ọ DỊ MMA'; // Example

  // @override
  // String get cancelButtonLabel => 'Kagbuo'; // Example

  static Future<WidgetsLocalizations> load(Locale locale) {
    return SynchronousFuture<WidgetsLocalizations>(const IgboWidgetsLocalizations());
  }

  static const LocalizationsDelegate<WidgetsLocalizations> delegate = _IgboWidgetsLocalizationsDelegate();

  @override
  String get reorderItemDown => 'Bugharịa gbadaa';

  @override
  String get reorderItemLeft => 'Bugharịa aka ekpe';

  @override
  String get reorderItemRight => 'Bugharịa aka nri';

  @override
  String get reorderItemToEnd => 'Bugharịa na njedebe';

  @override
  String get reorderItemToStart => 'Bugharịa na mmalite';

  @override
  String get reorderItemUp => 'Bugharịa welie';
}

class _IgboWidgetsLocalizationsDelegate extends LocalizationsDelegate<WidgetsLocalizations> {
  const _IgboWidgetsLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => locale.languageCode == 'ig';
  @override
  Future<WidgetsLocalizations> load(Locale locale) => IgboWidgetsLocalizations.load(locale);

  @override
  bool shouldReload(_IgboWidgetsLocalizationsDelegate old) => false;
}

class IgboCupertinoLocalizations implements CupertinoLocalizations {
  const IgboCupertinoLocalizations();

  @override
  String get alertDialogLabel => 'Ngosi';

  @override
  String get anteMeridiemAbbreviation => 'ỤTỤTỤ';

  @override
  String get copyButtonLabel => 'Detuo';

  @override
  String get cutButtonLabel => 'Bipụ';

  @override
  String datePickerDayOfMonth(int dayIndex, [int? weekDay]) => dayIndex.toString();

  @override
  String datePickerHour(int hour) => hour.toString();

  @override
  String datePickerHourSemanticsLabel(int hour) => '$hour elekere';

  @override
  String datePickerMediumDate(DateTime date) {
    return intl.DateFormat.yMMMd('ig').format(date);
  }

  @override
  String datePickerMinute(int minute) => minute.toString().padLeft(2, '0');

  @override
  String datePickerMinuteSemanticsLabel(int minute) => '$minute nkeji';

  @override
  String datePickerMonth(int monthIndex) {
    // Assuming monthIndex is 1-based (January is 1)
    // You might need a list of Igbo month names
    const igboMonths = ['Jenụwarị', 'Febụwarị', 'Maachị', 'Eprel', 'Mee', 'Juun', 'Julaị', 'Ọgọọst', 'Septemba', 'Ọktoba', 'Nọvemba', 'Disemba'];
    return igboMonths[monthIndex - 1];
  }

  @override
  String datePickerYear(int yearIndex) => yearIndex.toString();

  @override
  String get pasteButtonLabel => 'Mado';

  @override
  String get postMeridiemAbbreviation => 'EFIFI';

  @override
  String get selectAllButtonLabel => 'Họrọ Ha Niile';

  @override
  String timerPickerHour(int hour) => hour.toString();

  @override
  String timerPickerHourLabel(int hour) => 'Elekere';

  @override
  String timerPickerMinute(int minute) => minute.toString();

  @override
  String timerPickerMinuteLabel(int minute) => 'Nkeji';

  @override
  String timerPickerSecond(int second) => second.toString();

  @override
  String timerPickerSecondLabel(int second) => 'Sekọnd';

  @override
  String get todayLabel => 'Taa';

  static Future<CupertinoLocalizations> load(Locale locale) {
    return SynchronousFuture<CupertinoLocalizations>(const IgboCupertinoLocalizations());
  }

  static const LocalizationsDelegate<CupertinoLocalizations> delegate = _IgboCupertinoLocalizationsDelegate();

  @override
  String get clearButtonLabel => 'Kpochapụ';

  @override
  DatePickerDateOrder get datePickerDateOrder => DatePickerDateOrder.mdy;

  @override
  DatePickerDateTimeOrder get datePickerDateTimeOrder => DatePickerDateTimeOrder.date_time_dayPeriod;

  @override
  String datePickerStandaloneMonth(int monthIndex) {
    const igboMonths = ['Jenụwarị', 'Febụwarị', 'Maachị', 'Eprel', 'Mee', 'Juun', 'Julaị', 'Ọgọọst', 'Septemba', 'Ọktoba', 'Nọvemba', 'Disemba'];
    return igboMonths[monthIndex - 1];
  }

  @override
  String get lookUpButtonLabel => 'Chọta';

  @override
  String get menuDismissLabel => 'Wepụ menu';

  @override
  String get modalBarrierDismissLabel => 'Wepụ';

  @override
  String get noSpellCheckReplacementsLabel => 'Ọnweghị ndochi ahụrụ';

  @override
  String get searchTextFieldPlaceholderLabel => 'Chọọ';

  @override
  String get searchWebButtonLabel => 'Chọọ na Weebụ';

  @override
  String get shareButtonLabel => 'Kee';

  @override
  String tabSemanticsLabel({required int tabIndex, required int tabCount}) {
    // Ensure tabIndex is 1-based for display
    return 'Taabụ ${tabIndex + 1} nke $tabCount';
  }

  @override
  List<String> get timerPickerHourLabels => <String>[];

  @override
  List<String> get timerPickerMinuteLabels => <String>[];

  @override
  List<String> get timerPickerSecondLabels => <String>[];

  // @override
  // For timer picker labels, returning null often means the framework will use default numeric representations.
  // If specific wordings are needed for each number, a list of strings should be returned.
  // DefaultCupertinoLocalizations returns null for these.
  // List<String>? get timerPickerHourLabels => null;

  // @override
  // List<String>? get timerPickerMinuteLabels => null;

  // @override
  // List<String>? get timerPickerSecondLabels => null;
}

class _IgboCupertinoLocalizationsDelegate extends LocalizationsDelegate<CupertinoLocalizations> {
  const _IgboCupertinoLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => locale.languageCode == 'ig';

  @override
  Future<CupertinoLocalizations> load(Locale locale) => IgboCupertinoLocalizations.load(locale);

  @override
  bool shouldReload(_IgboCupertinoLocalizationsDelegate old) => false;
}
