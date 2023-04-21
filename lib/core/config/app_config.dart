import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future<void> initConfig() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
}

Locale? localeCallback(locale, supportedLocales) {
  for (final supportedLocale in supportedLocales) {
    if (supportedLocale.languageCode == locale!.languageCode) {
      return supportedLocale;
    }
  }
  return supportedLocales.first;
}

class AppScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
