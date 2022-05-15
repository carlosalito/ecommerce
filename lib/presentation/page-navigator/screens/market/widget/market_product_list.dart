import 'package:e_commerce_desafio/domain/entities/product/product_entity.dart';
import 'package:e_commerce_desafio/infra/theme/theme_constants.dart';
import 'package:e_commerce_desafio/presentation/page-navigator/screens/market/widget/product_grid_item.dart';
import 'package:flutter/material.dart';

class MarketProductList extends StatelessWidget {
  final List<ProductEntity> products;
  final ScrollController scrollController;
  final Function(int) onQuantityChange;

  const MarketProductList({
    required this.products,
    required this.onQuantityChange,
    required this.scrollController,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: ThemeConstants.padding,
        crossAxisSpacing: ThemeConstants.padding,
        childAspectRatio: .76,
        clipBehavior: Clip.none,
        shrinkWrap: true,
        children: products
            .map(
              (product) => ProductGridItem(
                product: product,
                height: constraints.biggest.height * .45,
                onQuantityChange: onQuantityChange,
              ),
            )
            .toList(),
      );
    });
  }
}
