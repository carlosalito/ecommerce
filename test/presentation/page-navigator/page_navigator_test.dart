import 'package:e_commerce_desafio/di/injectable.dart';
import 'package:e_commerce_desafio/presentation/page-navigator/controller/page_navigator_controller.dart';
import 'package:e_commerce_desafio/presentation/page-navigator/page-navigator.dart';
import 'package:e_commerce_desafio/presentation/page-navigator/screens/favorite/favorite_screen.dart';
import 'package:e_commerce_desafio/presentation/page-navigator/screens/invoice/invoice_screen.dart';
import 'package:e_commerce_desafio/presentation/page-navigator/screens/market/market_screen.dart';
import 'package:e_commerce_desafio/presentation/page-navigator/screens/profile/profile_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flutter_i18n/loaders/decoders/yaml_decode_strategy.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

void main() {
  late MaterialApp widgetApp;

  setUp(() {
    if (!getIt.isRegistered<PageNavigatorController>()) {
      getIt.registerSingleton<PageNavigatorController>(PageNavigatorController());
    }

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
      home: PageNavigatorScreen(),
    );
  });

  testWidgets('When click on page1 button then MarketScreen is showing', (WidgetTester tester) async {
    await tester.pumpWidget(widgetApp);
    await tester.pumpAndSettle();
    final buttons = find.byWidgetPredicate((widget) => widget is GButton);
    expect(buttons, findsNWidgets(4));

    await tester.tap(buttons.first);
    await tester.pumpAndSettle();
    final tab1 = find.byWidgetPredicate((widget) => widget is MarketScreen);
    final widgetTab1 = buttons.at(0).evaluate().single.widget as GButton;
    expect(tab1, findsOneWidget);
    expect(widgetTab1.text, 'Início');

    await tester.tap(buttons.at(1));
    await tester.pumpAndSettle();
    final tab2 = find.byWidgetPredicate((widget) => widget is FavoriteScreen);
    final widgetTab2 = buttons.at(1).evaluate().single.widget as GButton;
    expect(tab2, findsOneWidget);
    expect(widgetTab2.text, 'Favoritos');

    await tester.tap(buttons.at(2));
    await tester.pumpAndSettle();
    final tab3 = find.byWidgetPredicate((widget) => widget is InvoiceScreen);
    final widgetTab3 = buttons.at(2).evaluate().single.widget as GButton;
    expect(tab3, findsOneWidget);
    expect(widgetTab3.text, 'Compras');

    await tester.tap(buttons.last);
    await tester.pumpAndSettle();
    final tab4 = find.byWidgetPredicate((widget) => widget is ProfileScreen);
    final widgetTab4 = buttons.at(3).evaluate().single.widget as GButton;
    expect(tab4, findsOneWidget);
    expect(widgetTab4.text, 'Perfil');
  });
}
