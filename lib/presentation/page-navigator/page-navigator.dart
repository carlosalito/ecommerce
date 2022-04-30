import 'package:e_commerce_desafio/di/injectable.dart';
import 'package:e_commerce_desafio/infra/i18n/i18n_helper.dart';
import 'package:e_commerce_desafio/infra/theme/app_icons.dart';
import 'package:e_commerce_desafio/infra/theme/default_colors.dart';
import 'package:e_commerce_desafio/infra/theme/theme_constants.dart';
import 'package:e_commerce_desafio/presentation/page-navigator/screens/favorite/favorite_screen.dart';
import 'package:e_commerce_desafio/presentation/page-navigator/screens/invoice/invoice_screen.dart';
import 'package:e_commerce_desafio/presentation/page-navigator/screens/market/market_screen.dart';
import 'package:e_commerce_desafio/presentation/page-navigator/screens/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'controller/page_navigator_controller.dart';

class PageNavigatorScreen extends StatelessWidget with I18nStatelessTranslate {
  PageNavigatorScreen({Key? key}) : super(key: key) {
    setBaseTranslate('pageNavigator.');
  }

  final controller = getIt<PageNavigatorController>();

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return Scaffold(
        bottomNavigationBar: Container(
          padding: const EdgeInsets.all(ThemeConstants.halfPadding),
          color: Theme.of(context).colorScheme.background,
          child: GNav(
            rippleColor: Theme.of(context).colorScheme.primary,
            hoverColor: Theme.of(context).colorScheme.primary.withAlpha(100),
            haptic: true,
            tabBorderRadius: 25,
            tabActiveBorder: Border.all(color: Theme.of(context).colorScheme.primary, width: 1.0),
            curve: Curves.easeIn,
            duration: const Duration(milliseconds: 350),
            gap: ThemeConstants.halfPadding,
            color: AppColors.iconColor,
            iconSize: 24,
            tabBackgroundColor: Theme.of(context).colorScheme.primary,
            activeColor: Theme.of(context).colorScheme.background,
            padding: const EdgeInsets.symmetric(
              horizontal: ThemeConstants.padding,
              vertical: ThemeConstants.halfPadding,
            ),
            onTabChange: (int index) => controller.navigateToPage(index),
            tabs: [
              GButton(icon: AppIcons.home, text: translate(context, 'page1')),
              GButton(icon: AppIcons.favorite, text: translate(context, 'page2')),
              GButton(icon: AppIcons.invoice, text: translate(context, 'page3')),
              GButton(icon: AppIcons.account, text: translate(context, 'page4')),
            ],
          ),
        ),
        body: _selectedPage(controller.selectedPage),
      );
    });
  }

  Widget _selectedPage(int page) {
    final Map<int, Widget> pagesMap = {
      0: const MarketScreen(),
      1: const FavoriteScreen(),
      2: const InvoiceScreen(),
      3: const ProfileScreen(),
    };

    Widget pageWidget = pagesMap[0]!;
    if (page <= pagesMap.length - 1) {
      pageWidget = pagesMap[page]!;
    }

    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.all(ThemeConstants.padding),
      child: pageWidget,
    ));
  }
}
