// Place fonts/ecommerce.ttf in your fonts/ directory and
// add the following to your pubspec.yaml
// flutter:
//   fonts:
//    - family: ecommerce
//      fonts:
//       - asset: fonts/ecommerce.ttf
import 'package:flutter/widgets.dart';

class AppIcons {
  AppIcons._();

  static const String _fontFamily = 'AppIcons';

  static const IconData account = IconData(0xe900, fontFamily: _fontFamily);
  static const IconData cart = IconData(0xe901, fontFamily: _fontFamily);
  static const IconData favorite = IconData(0xe902, fontFamily: _fontFamily);
  static const IconData grid = IconData(0xe903, fontFamily: _fontFamily);
  static const IconData home = IconData(0xe904, fontFamily: _fontFamily);
  static const IconData invoice = IconData(0xe905, fontFamily: _fontFamily);
  static const IconData minus = IconData(0xe906, fontFamily: _fontFamily);
  static const IconData plus = IconData(0xe907, fontFamily: _fontFamily);
  static const IconData row = IconData(0xe908, fontFamily: _fontFamily);
}
