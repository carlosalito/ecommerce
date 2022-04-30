import 'package:e_commerce_desafio/presentation/page-navigator/controller/page_navigator_controller.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final controller = PageNavigatorController();

  test('When call to navigate page then selectedPage change', () {
    const int _page = 1;
    controller.navigateToPage(_page);
    expect(controller.selectedPage, _page);
  });
}
