import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meets_igbo/config/constants/nav_routes.dart';
import 'package:flutter_meets_igbo/config/constants/text_constants.dart';
import 'package:flutter_meets_igbo/config/localization/igbo_localization_delegate.dart';
import 'package:flutter_meets_igbo/config/theme/app_theme.dart';
import 'package:flutter_meets_igbo/src/chat/chat.dart';
import 'package:flutter_meets_igbo/src/chat/controller/chat_controller.dart';
import 'package:flutter_meets_igbo/src/home/provider/home_controller.dart';
import 'package:flutter_meets_igbo/src/home/views/screens/home_screen.dart';
import 'package:flutter_meets_igbo/src/home/views/screens/main_screen.dart';
import 'package:flutter_meets_igbo/src/onboard/views/sign_in_screen.dart';
import 'package:flutter_meets_igbo/src/onboard/views/sign_up_screen.dart';
import 'package:flutter_meets_igbo/src/onboard/views/splash_screen.dart';
import 'package:flutter_meets_igbo/src/utils/shared_prefs.dart';
import 'package:flutter_meets_igbo/src/widgets/dialogs.dart';

final HomeController homeController = HomeController();
final ChatController chatController = ChatController();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await SharedPreferencesHelper.initSharedPref();
  chatController.getStory();
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en', 'US'), Locale('es', 'ES'), Locale('ig', 'NG')],
      saveLocale: true,
      path: 'assets/l10n',
      fallbackLocale: const Locale('en', 'US'),

      child: const MyApp(),
    ),
  );
}

/// The Widget that configures your application.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      restorationScopeId: 'app',
      debugShowCheckedModeBanner: false,
      scaffoldMessengerKey: rootScaffoldMessengerKey,
      localizationsDelegates: [
        IgboCupertinoLocalizations.delegate,
        IgboMaterialLocalizations.delegate,
        IgboWidgetsLocalizations.delegate,
        ...context.localizationDelegates,
      ],

      supportedLocales: context.supportedLocales,
      locale: context.locale,
      onGenerateTitle: (BuildContext context) => TextConstant.appTitle.tr(),
      theme: themeBuilder(defaultTheme: ThemeData.light(), isDark: false),
      darkTheme: themeBuilder(defaultTheme: ThemeData.dark(), isDark: true),
      home: const SplashScreen(),
      onGenerateRoute: (RouteSettings routeSettings) {
        return MaterialPageRoute<void>(
          settings: routeSettings,
          builder: (BuildContext context) {
            switch (routeSettings.name) {
              case NavRoutes.createAccountScreenRoute:
                return const SignUpScreen();
              case NavRoutes.loginScreenRoute:
                return const LoginScreen();
              case NavRoutes.homeScreenRoute:
                return const HomeScreen();
              case NavRoutes.chatScreenRoute:
                return const ChatHomeScreen();
              case NavRoutes.mainScreenRoute:
                return const MainScreen();
              default:
                return const SignUpScreen();
            }
          },
        );
      },
    );
  }
}
