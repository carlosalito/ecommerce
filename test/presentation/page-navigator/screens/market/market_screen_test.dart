import 'package:e_commerce_desafio/presentation/page-navigator/screens/market/market_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flutter_i18n/loaders/decoders/yaml_decode_strategy.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late MaterialApp widgetApp;

  setUp(() {
    widgetApp = MaterialApp(
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
      home: const MarketScreen(),
    );
  });

  testWidgets('when init render done then a list of products is showing', (WidgetTester tester) async {});
}
