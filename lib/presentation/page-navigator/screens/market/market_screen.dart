import 'package:e_commerce_desafio/di/injectable.dart';
import 'package:e_commerce_desafio/infra/i18n/i18n_helper.dart';
import 'package:e_commerce_desafio/infra/theme/app_icons.dart';
import 'package:e_commerce_desafio/presentation/page-navigator/screens/market/controller/market_controller.dart';
import 'package:e_commerce_desafio/presentation/shared/buttons/custom_action_button.dart';
import 'package:e_commerce_desafio/presentation/shared/header/app_header.dart';
import 'package:e_commerce_desafio/presentation/shared/spacers/pacers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'widget/market_product_list.dart';

class MarketScreen extends StatefulWidget {
  const MarketScreen({Key? key}) : super(key: key);

  @override
  State<MarketScreen> createState() => _MarketScreenState();
}

class _MarketScreenState extends State<MarketScreen> with I18nStatefulTranslate {
  final controller = getIt<MarketController>();
  final ScrollController scrollController = ScrollController();

  @override
  initState() {
    super.initState();
    setBaseTranslate('pageNavigator.screen1.');
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      controller.list();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppHeader(
          title: translate('title'),
          actionButton: CustomActionButton(
            icon: AppIcons.cart,
            badgeInfo: '01',
            onTap: () {},
          ),
        ),
        const SpacerVertical.normal(),
        Container(height: 45, color: Colors.black12),
        const SpacerVertical.half(),
        Container(height: 45, color: Colors.black12),
        const SpacerVertical.half(),
        Observer(builder: (context) {
          return Expanded(
            child: MarketProductList(
              products: controller.products,
              scrollController: scrollController,
              onQuantityChange: (_) {},
            ),
          );
        }),
      ],
    );
  }
}
