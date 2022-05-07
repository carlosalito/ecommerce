import 'package:e_commerce_desafio/domain/entities/product/product_entity.dart';
import 'package:flutter/material.dart';

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
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          onQuantityChange(2);
        },
        child: Ink(),
      ),
    );
  }
}
