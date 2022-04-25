import 'package:e_commerce_desafio/infra/constants/named_routes.dart';
import 'package:e_commerce_desafio/presentation/page-navigator/page-navigator.dart';
import 'package:e_commerce_desafio/presentation/splash/splash_screen.dart';
import 'package:flutter/material.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {
  NamedRoutes.splash: (context) => const SplashScreen(),
  NamedRoutes.pageNavigator: (context) => PageNavigatorScreen()
};
