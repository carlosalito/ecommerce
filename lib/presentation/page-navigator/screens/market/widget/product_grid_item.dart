import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_desafio/di/injectable.dart';
import 'package:e_commerce_desafio/domain/entities/product/product_entity.dart';
import 'package:e_commerce_desafio/infra/theme/theme_constants.dart';
import 'package:e_commerce_desafio/presentation/page-navigator/screens/market/widget/product_image_error.dart';
import 'package:e_commerce_desafio/presentation/page-navigator/screens/market/widget/product_price_action.dart';
import 'package:e_commerce_desafio/presentation/shared/spacers/pacers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class ProductGridItem extends StatelessWidget {
  final ProductEntity product;
  final void Function(int) onQuantityChange;

  const ProductGridItem({
    required this.product,
    required this.onQuantityChange,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CachedNetworkImage(
          cacheManager: getIt<DefaultCacheManager>(),
          imageUrl: product.image,
          imageBuilder: (BuildContext context, ImageProvider imageProvider) => Container(
            padding: const EdgeInsets.symmetric(
              horizontal: ThemeConstants.padding,
              vertical: ThemeConstants.halfPadding,
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.fitWidth,
              ),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(ThemeConstants.borderRadius),
                topRight: Radius.circular(ThemeConstants.borderRadius),
              ),
            ),
          ),
          placeholder: (BuildContext context, String url) => Center(
            child: SizedBox(
              height: ThemeConstants.loadingSize,
              width: ThemeConstants.loadingSize,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).colorScheme.primary),
              ),
            ),
          ),
          errorWidget: (BuildContext context, String url, error) => const ProductImageError(),
        ),
        Padding(
          padding: const EdgeInsets.all(ThemeConstants.padding),
          child: Column(
            children: [
              Text(product.name, style: Theme.of(context).textTheme.headline2),
              const SpacerHorizontal.normal(),
              ProductPriceAction(
                product: product,
                onQuantityChange: onQuantityChange,
              ),
            ],
          ),
        )
      ],
    );
  }
}
