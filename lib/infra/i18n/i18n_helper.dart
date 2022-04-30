import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';

class I18nHelper {
  String translate(
    BuildContext context,
    String key, {
    Map<String, String>? params,
  }) {
    if (params != null) {
      return FlutterI18n.translate(context, key, translationParams: params).replaceAll('#n', '\n');
    } else {
      return FlutterI18n.translate(context, key, fallbackKey: key).replaceAll('#n', '\n');
    }
  }
}

mixin I18nStatelessTranslate {
  late final String _baseTranslate;

  void setBaseTranslate(String value) {
    _baseTranslate = value;
  }

  String translate(BuildContext context, String key, {Map<String, String>? params, useBaseTranslate = true}) {
    String _key = key;
    if (useBaseTranslate) _key = '$_baseTranslate$key';

    return I18nHelper().translate(context, _key, params: params);
  }
}

mixin I18nStatefulTranslate<T extends StatefulWidget> on State<T> {
  late final String _baseTranslate;

  void setBaseTranslate(String value) {
    _baseTranslate = value;
  }

  String translate(String key, {Map<String, String>? params, useBaseTranslate = true}) {
    String _key = key;
    if (useBaseTranslate) _key = '$_baseTranslate$key';

    return I18nHelper().translate(context, _key, params: params);
  }
}
