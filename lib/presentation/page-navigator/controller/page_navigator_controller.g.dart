// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'page_navigator_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PageNavigatorController on _PageNavigatorControllerBase, Store {
  late final _$selectedPageAtom =
      Atom(name: '_PageNavigatorControllerBase.selectedPage', context: context);

  @override
  int get selectedPage {
    _$selectedPageAtom.reportRead();
    return super.selectedPage;
  }

  @override
  set selectedPage(int value) {
    _$selectedPageAtom.reportWrite(value, super.selectedPage, () {
      super.selectedPage = value;
    });
  }

  late final _$_PageNavigatorControllerBaseActionController =
      ActionController(name: '_PageNavigatorControllerBase', context: context);

  @override
  void navigateToPage(int page) {
    final _$actionInfo = _$_PageNavigatorControllerBaseActionController
        .startAction(name: '_PageNavigatorControllerBase.navigateToPage');
    try {
      return super.navigateToPage(page);
    } finally {
      _$_PageNavigatorControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selectedPage: ${selectedPage}
    ''';
  }
}
