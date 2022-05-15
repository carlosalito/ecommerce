import 'package:auto_size_text/auto_size_text.dart';
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
  final double height;

  const ProductGridItem({
    required this.product,
    required this.onQuantityChange,
    required this.height,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(ThemeConstants.borderRadius), boxShadow: const [
        BoxShadow(
          offset: Offset(2, 2),
          color: Colors.black54,
          blurRadius: 4.0,
          spreadRadius: 0,
        ),
      ]),
      child: Column(
        children: [
          Container(
            height: height * .6,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(ThemeConstants.borderRadius),
                topRight: Radius.circular(ThemeConstants.borderRadius),
              ),
              color: Theme.of(context).colorScheme.secondary,
            ),
            padding: const EdgeInsets.all(ThemeConstants.padding),
            child: CachedNetworkImage(
              cacheManager: getIt<DefaultCacheManager>(),
              imageUrl: product.image,
              imageBuilder: (BuildContext context, ImageProvider imageProvider) => Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.fitHeight,
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
          ),
          Container(
            height: height * .40,
            padding:
                const EdgeInsets.symmetric(horizontal: ThemeConstants.halfPadding, vertical: ThemeConstants.minPadding),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onBackground,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(ThemeConstants.borderRadius),
                bottomRight: Radius.circular(ThemeConstants.borderRadius),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AutoSizeText(
                  product.name,
                  style: Theme.of(context).textTheme.headline2,
                  maxLines: 1,
                  minFontSize: 11,
                ),
                const SpacerVertical.half(),
                ProductPriceAction(
                  product: product,
                  onQuantityChange: onQuantityChange,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
