import 'package:e_commerce_desafio/infra/theme/theme_constants.dart';
import 'package:e_commerce_desafio/presentation/shared/spacers/pacers.dart';
import 'package:flutter/material.dart';

import 'product_action_short_button.dart';

class ProductActionFullButton extends StatelessWidget {
  final int quantity;
  final int stock;
  final void Function(int) onQuantityChange;

  const ProductActionFullButton({
    required this.quantity,
    required this.stock,
    required this.onQuantityChange,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(ThemeConstants.borderRadius),
          border: Border.all(
            color: Theme.of(context).colorScheme.surface,
          )),
      child: Row(
        children: [
          ProductActionShortButton(
            onTap: () => _removeQuantity(),
            backgroundColor: Theme.of(context).colorScheme.onBackground,
            icon: Icons.remove,
          ),
          const SpacerHorizontal.half(),
          Text(
            quantity.toString().padLeft(2, '0'),
            style: Theme.of(context).textTheme.headline5?.copyWith(
                  color: Theme.of(context).colorScheme.tertiary,
                ),
          ),
          const SpacerHorizontal.half(),
          ProductActionShortButton(
            onTap: () => _addQuantity(),
            backgroundColor: Theme.of(context).colorScheme.onBackground,
            icon: Icons.add,
            iconColor: Theme.of(context).colorScheme.primary,
          )
        ],
      ),
    );
  }

  void _removeQuantity() {
    if (quantity > 0) {
      onQuantityChange(quantity - 1);
    }
  }

  void _addQuantity() {
    if (quantity < stock) {
      onQuantityChange(quantity + 1);
    }
  }
}
