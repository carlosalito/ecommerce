import 'package:e_commerce_desafio/di/injectable.dart';
import 'package:e_commerce_desafio/infra/theme/default_colors.dart';
import 'package:e_commerce_desafio/infra/theme/theme_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'controller/page_navigator_controller.dart';

class PageNavigatorScreen extends StatelessWidget {
  PageNavigatorScreen({Key? key}) : super(key: key);

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
            tabs: const [
              GButton(icon: Icons.ac_unit, text: 'Page 1'),
              GButton(icon: Icons.ac_unit, text: 'Page 2'),
              GButton(icon: Icons.ac_unit, text: 'Page 3'),
              GButton(icon: Icons.ac_unit, text: 'Page 4'),
            ],
          ),
        ),
        body: _selectedPage(controller.selectedPage),
      );
    });
  }

  Widget _selectedPage(int page) {
    final Map<int, Widget> pagesMap = {
      0: Container(
          color: Colors.amber,
          child: SafeArea(
              child: Container(
            color: Colors.amber,
            child: Text('Market'),
          ))),
      1: Container(color: Colors.teal),
      2: Container(color: Colors.redAccent),
      3: Container(color: Colors.blue),
    };

    if (page <= pagesMap.length - 1) {
      return pagesMap[page]!;
    }

    return pagesMap[0]!;
  }
}
