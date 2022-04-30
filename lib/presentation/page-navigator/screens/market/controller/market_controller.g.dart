// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'market_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MarketController on _MarketControllerBase, Store {
  late final _$pageInfoAtom =
      Atom(name: '_MarketControllerBase.pageInfo', context: context);

  @override
  PageInfoResponse get pageInfo {
    _$pageInfoAtom.reportRead();
    return super.pageInfo;
  }

  @override
  set pageInfo(PageInfoResponse value) {
    _$pageInfoAtom.reportWrite(value, super.pageInfo, () {
      super.pageInfo = value;
    });
  }

  late final _$productsAtom =
      Atom(name: '_MarketControllerBase.products', context: context);

  @override
  List<ProductEntity> get products {
    _$productsAtom.reportRead();
    return super.products;
  }

  @override
  set products(List<ProductEntity> value) {
    _$productsAtom.reportWrite(value, super.products, () {
      super.products = value;
    });
  }

  late final _$pageAtom =
      Atom(name: '_MarketControllerBase.page', context: context);

  @override
  int get page {
    _$pageAtom.reportRead();
    return super.page;
  }

  @override
  set page(int value) {
    _$pageAtom.reportWrite(value, super.page, () {
      super.page = value;
    });
  }

  late final _$listAsyncAction =
      AsyncAction('_MarketControllerBase.list', context: context);

  @override
  Future<void> list() {
    return _$listAsyncAction.run(() => super.list());
  }

  @override
  String toString() {
    return '''
pageInfo: ${pageInfo},
products: ${products},
page: ${page}
    ''';
  }
}
