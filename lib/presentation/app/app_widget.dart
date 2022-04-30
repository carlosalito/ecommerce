import 'package:e_commerce_desafio/infra/constants/named_routes.dart';
import 'package:e_commerce_desafio/infra/theme/default_theme.dart';
import 'package:e_commerce_desafio/presentation/app/app_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flutter_i18n/loaders/decoders/yaml_decode_strategy.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'app_routes.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      _observeFailure();
    });
  }

  @override
  void dispose() {
    AppConfig.instance.onDispose();
    super.dispose();
  }

  void _observeFailure() {
    AppConfig.instance.streamError.stream.listen((failure) {
      if (failure != null) {
        print('Novo erro ${failure.toString()}');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ECommerce Demo',
      theme: CustomThemes.defaultTheme,
      locale: _getLocale,
      localizationsDelegates: [
        FlutterI18nDelegate(
            translationLoader: FileTranslationLoader(
          useCountryCode: true,
          basePath: 'assets/i18n',
          decodeStrategies: [YamlDecodeStrategy()],
          fallbackFile: 'pt_BR',
          forcedLocale: _getLocale,
        )),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        DefaultCupertinoLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('pt', 'BR'),
      ],
      initialRoute: NamedRoutes.splash,
      routes: appRoutes,
    );
  }

  Locale get _getLocale => const Locale('pt', 'BR');
}
