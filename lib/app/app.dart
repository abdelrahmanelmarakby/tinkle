import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:tinkle/core/global.dart';
import 'package:tinkle/core/services/bindings_service.dart';
import 'package:tinkle/core/services/notification_settings.dart';
import 'package:tinkle/core/services/theme_service.dart';
import 'package:tinkle/core/services/translations_service.dart';

import 'routes/app_pages.dart';

class MyApp extends StatefulWidget {
  //const private named constructor
  const MyApp._internal();
  //Singleton
  static const MyApp _instance = MyApp._internal();
  //Factory for creating instances of the class
  factory MyApp() {
    return _instance;
  }
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return OverlaySupport(
      toastTheme: ToastThemeData(
        background: Color(0xff045681),
        textColor: Colors.white,
      ),
      child: GetMaterialApp(
        onInit: () {
          final firebaseMessaging = FCM();
          firebaseMessaging.setNotifications();
        },
        navigatorObservers: [
          SentryNavigatorObserver(
            enableAutoTransactions: true,
          )
        ],
        initialBinding: Binding(),
        initialRoute:
            userSettings.getIsLogged != true ? Routes.SETTINGS : Routes.HOME,
        getPages: AppPages.routes,
        defaultTransition: Transition.size,
        debugShowCheckedModeBanner: false,
        enableLog: true,
        theme: Themes.light,
        darkTheme: Themes.dark,
        themeMode: ThemeService().theme,
        translations: TranslationsService(), // your translations
        locale: userSettings
            .language, // translations will be displayed in that locale
        fallbackLocale: userSettings.language,
        // specify the fallback locale in case an invalid locale is selected.
      ),
    );
  }
}
