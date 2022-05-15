import 'package:e_commerce_desafio/domain/entities/product/product_entity.dart';
import 'package:e_commerce_desafio/presentation/page-navigator/screens/market/widget/product_action_short_button.dart';
import 'package:flutter/material.dart';

import 'product_action_full_button.dart';

class ProductActionButton extends StatelessWidget {
  final ProductEntity product;
  final void Function(int) onQuantityChange;

  const ProductActionButton({
    required this.product,
    required this.onQuantityChange,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return product.quantity != null && product.quantity! > 0
        ? ProductActionFullButton(
            stock: product.stock,
            quantity: product.quantity!,
            onQuantityChange: (int quant) => onQuantityChange(quant),
          )
        : ProductActionShortButton(
            icon: Icons.add,
            onTap: () => onQuantityChange(1),
          );
  }
}
