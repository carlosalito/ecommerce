import 'package:e_commerce_desafio/infra/theme/default_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flutter_i18n/loaders/decoders/yaml_decode_strategy.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

MaterialApp makeApp(Widget home) {
  return MaterialApp(
    title: 'ECommerce Demo',
    theme: CustomThemes.defaultTheme,
    locale: const Locale('pt', 'BR'),
    localizationsDelegates: [
      FlutterI18nDelegate(
          translationLoader: FileTranslationLoader(
        useCountryCode: true,
        basePath: 'assets/i18n',
        decodeStrategies: [YamlDecodeStrategy()],
        fallbackFile: 'pt_BR',
        forcedLocale: const Locale('pt', 'BR'),
      )),
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      DefaultCupertinoLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
    ],
    supportedLocales: const [
      Locale('pt', 'BR'),
    ],
    home: home,
  );
}
