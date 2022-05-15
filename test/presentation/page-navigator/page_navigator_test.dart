import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:e_commerce_desafio/di/injectable.dart';
import 'package:e_commerce_desafio/domain/use-cases/product/get_products.dart';
import 'package:e_commerce_desafio/infra/failure/failure.dart';
import 'package:e_commerce_desafio/presentation/app/app_config.dart';
import 'package:e_commerce_desafio/presentation/page-navigator/controller/page_navigator_controller.dart';
import 'package:e_commerce_desafio/presentation/page-navigator/page-navigator.dart';
import 'package:e_commerce_desafio/presentation/page-navigator/screens/favorite/favorite_screen.dart';
import 'package:e_commerce_desafio/presentation/page-navigator/screens/invoice/invoice_screen.dart';
import 'package:e_commerce_desafio/presentation/page-navigator/screens/market/controller/market_controller.dart';
import 'package:e_commerce_desafio/presentation/page-navigator/screens/market/market_screen.dart';
import 'package:e_commerce_desafio/presentation/page-navigator/screens/profile/profile_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flutter_i18n/loaders/decoders/yaml_decode_strategy.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:mockito/mockito.dart';

import '../../fixtures/globals.dart';
import '../../fixtures/product_fixture.dart';
import 'screens/market/controller/market_controller_test.mocks.dart';
import 'screens/market/widget/product_grid_item_test.mocks.dart';

void main() {
  late MaterialApp widgetApp;
  late GetProductsUseCase getProductsUseCase;
  late DefaultCacheManager _mockDefaultCacheManager;

  setUp(() {
    getProductsUseCase = MockGetProductsUseCase();
    _mockDefaultCacheManager = MockDefaultCacheManager();

    if (!getIt.isRegistered<DefaultCacheManager>()) {
      getIt.registerSingleton<DefaultCacheManager>(_mockDefaultCacheManager);
    }

    if (!getIt.isRegistered<PageNavigatorController>()) {
      getIt.registerSingleton<PageNavigatorController>(PageNavigatorController());
    }

    if (!getIt.isRegistered<GetProductsUseCase>()) {
      getIt.registerFactory<GetProductsUseCase>(() => getProductsUseCase);
    }

    if (!getIt.isRegistered<MarketController>()) {
      getIt.registerFactory<MarketController>(() => MarketController(getProductsUseCase: getIt()));
    }

    final StreamController<Failure?> streamError = StreamController<Failure?>.broadcast();

    AppConfig(
      streamError: streamError,
      onDispose: () {
        streamError.close();
      },
    );

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
    when(getProductsUseCase.call(0)).thenAnswer((_) async => right(responseProductList));

    await tester.binding.setSurfaceSize(GlobalFixture.testerSize);
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
  });

  testWidgets('When click on page2 button then FavoriteScreen is showing', (WidgetTester tester) async {
    when(getProductsUseCase.call(0)).thenAnswer((_) async => right(responseProductList));

    await tester.binding.setSurfaceSize(GlobalFixture.testerSize);
    await tester.pumpWidget(widgetApp);
    await tester.pumpAndSettle();
    final buttons = find.byWidgetPredicate((widget) => widget is GButton);
    expect(buttons, findsNWidgets(4));

    await tester.tap(buttons.at(1));
    await tester.pumpAndSettle();
    final tab2 = find.byWidgetPredicate((widget) => widget is FavoriteScreen);
    final widgetTab2 = buttons.at(1).evaluate().single.widget as GButton;
    expect(tab2, findsOneWidget);
    expect(widgetTab2.text, 'Favoritos');
  });

  testWidgets('When click on page3 button then InvoiceScreen is showing', (WidgetTester tester) async {
    when(getProductsUseCase.call(0)).thenAnswer((_) async => right(responseProductList));

    await tester.binding.setSurfaceSize(GlobalFixture.testerSize);
    await tester.pumpWidget(widgetApp);
    await tester.pumpAndSettle();
    final buttons = find.byWidgetPredicate((widget) => widget is GButton);
    expect(buttons, findsNWidgets(4));

    await tester.tap(buttons.at(2));
    await tester.pumpAndSettle();
    final tab3 = find.byWidgetPredicate((widget) => widget is InvoiceScreen);
    final widgetTab3 = buttons.at(2).evaluate().single.widget as GButton;
    expect(tab3, findsOneWidget);
    expect(widgetTab3.text, 'Compras');
  });

  testWidgets('When click on page4 button then ProfileScreen is showing', (WidgetTester tester) async {
    when(getProductsUseCase.call(0)).thenAnswer((_) async => right(responseProductList));

    await tester.binding.setSurfaceSize(GlobalFixture.testerSize);
    await tester.pumpWidget(widgetApp);
    await tester.pumpAndSettle();
    final buttons = find.byWidgetPredicate((widget) => widget is GButton);
    expect(buttons, findsNWidgets(4));

    await tester.tap(buttons.last);
    await tester.pumpAndSettle();
    final tab4 = find.byWidgetPredicate((widget) => widget is ProfileScreen);
    final widgetTab4 = buttons.at(3).evaluate().single.widget as GButton;
    expect(tab4, findsOneWidget);
    expect(widgetTab4.text, 'Perfil');
  });
}
