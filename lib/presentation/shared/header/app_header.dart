import 'package:e_commerce_desafio/presentation/shared/spacers/pacers.dart';
import 'package:flutter/material.dart';

class AppHeader extends StatelessWidget {
  final String title;
  final Widget? actionButton;

  const AppHeader({required this.title, this.actionButton, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
        if (actionButton != null) ...[
          const SpacerHorizontal.normal(),
          actionButton!,
        ]
      ],
    );
  }
}
