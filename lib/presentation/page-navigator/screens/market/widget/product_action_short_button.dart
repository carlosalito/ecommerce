import 'package:e_commerce_desafio/infra/theme/default_colors.dart';
import 'package:e_commerce_desafio/infra/theme/theme_constants.dart';
import 'package:flutter/material.dart';

class ProductActionShortButton extends StatelessWidget {
  final void Function() onTap;
  final IconData icon;
  final Color backgroundColor;
  final Color iconColor;

  const ProductActionShortButton({
    required this.icon,
    required this.onTap,
    this.backgroundColor = AppColors.backgroundGray,
    this.iconColor = AppColors.iconColor,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(ThemeConstants.borderRadius),
        onTap: onTap,
        child: Ink(
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(ThemeConstants.borderRadius),
          ),
          padding: const EdgeInsets.all(ThemeConstants.minPadding),
          child: Icon(
            icon,
            color: iconColor,
            size: ThemeConstants.iconSmallSize,
          ),
        ),
      ),
    );
  }
}
