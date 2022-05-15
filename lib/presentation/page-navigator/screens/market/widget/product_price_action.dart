import 'package:e_commerce_desafio/domain/entities/product/product_entity.dart';
import 'package:e_commerce_desafio/infra/i18n/i18n_helper.dart';
import 'package:e_commerce_desafio/presentation/page-navigator/screens/market/widget/product_action_button.dart';
import 'package:flutter/material.dart';

class ProductPriceAction extends StatelessWidget with I18nStatelessTranslate {
  final ProductEntity product;
  final void Function(int) onQuantityChange;

  ProductPriceAction({
    required this.product,
    required this.onQuantityChange,
    Key? key,
  }) : super(key: key) {
    setBaseTranslate('');
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              product.unit,
              style: Theme.of(context).textTheme.headline3?.copyWith(fontSize: 11.0),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${translate(context, 'common.moneyPrefix')} ${_getRoundValue()}${translate(context, 'common.decimalSeparator')}',
                  style: Theme.of(context).textTheme.headline3,
                ),
                Text(
                  _getCentsValue(),
                  style: Theme.of(context).textTheme.headline3?.copyWith(fontSize: 10.0),
                ),
              ],
            )
          ],
        ),
        const Expanded(child: SizedBox()),
        ProductActionButton(
          product: product,
          onQuantityChange: onQuantityChange,
        ),
      ],
    );
  }

  String _getRoundValue() {
    final priceFloor = product.price.floor();
    return priceFloor.toString();
  }

  String _getCentsValue() {
    final priceFloor = product.price.floor();
    final cents = product.price - priceFloor;
    return cents.toStringAsFixed(2).replaceFirst('0.', '');
  }
}
