import 'package:e_commerce_desafio/infra/theme/default_colors.dart';
import 'package:e_commerce_desafio/infra/theme/theme_constants.dart';
import 'package:flutter/material.dart';

class CustomActionButton extends StatelessWidget {
  final IconData icon;
  final void Function()? onTap;
  final String? badgeInfo;
  final Color? badgeColor;
  final Color? badgeTextColor;

  const CustomActionButton({
    required this.icon,
    this.onTap,
    this.badgeInfo,
    this.badgeColor = AppColors.primaryColor,
    this.badgeTextColor = Colors.white,
    Key? key,
  }) : super(key: key);

  BorderRadius get borderRadius => BorderRadius.circular(4.0);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 4.0, top: 4.0),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: onTap,
              borderRadius: borderRadius,
              child: Ink(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: borderRadius,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(ThemeConstants.halfPadding),
                  child: Icon(icon),
                ),
              ),
            ),
          ),
        ),
        if (badgeInfo != null)
          Positioned(
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(4.0),
              decoration: BoxDecoration(
                color: badgeColor,
                borderRadius: BorderRadius.circular(4.0),
              ),
              child: Text(
                badgeInfo!,
                style: Theme.of(context).textTheme.headline6?.copyWith(fontSize: 8.0, color: badgeTextColor),
              ),
            ),
          ),
      ],
    );
  }
}
