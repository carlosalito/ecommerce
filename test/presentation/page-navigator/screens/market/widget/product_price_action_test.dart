import 'package:e_commerce_desafio/presentation/page-navigator/screens/market/widget/product_action_button.dart';
import 'package:e_commerce_desafio/presentation/page-navigator/screens/market/widget/product_price_action.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../fixtures/product_fixture.dart';
import '../../setup_app.dart';

void main() {
  late MaterialApp app;
  int quantity = 0;

  void _incrementQuantity() {
    quantity += 1;
  }

  setUp(() {
    app = makeApp(
      ProductPriceAction(
        product: fakeProduct,
        onQuantityChange: (_) => _incrementQuantity(),
      ),
    );
  });

  testWidgets('check integrity ProductPriceAction widget', (WidgetTester tester) async {
    await tester.pumpWidget(app);
    await tester.pump();

    final productPriceActionFinder = find.byWidgetPredicate((widget) => widget is ProductPriceAction);
    expect(productPriceActionFinder, findsOneWidget);

    final textFinder = find.byWidgetPredicate((widget) => widget is Text);
    expect(textFinder, findsNWidgets(3));

    final unitTextWidget = textFinder.first.evaluate().single.widget as Text;
    expect(unitTextWidget.data, 'Kg');
    expect(unitTextWidget.style?.fontFamily, 'RedHatDisplay');
    expect(unitTextWidget.style?.fontSize, 11.0);

    final moneyPrefixTextWidget = textFinder.at(1).evaluate().single.widget as Text;
    expect(moneyPrefixTextWidget.data, 'R\$ 1,');
    expect(moneyPrefixTextWidget.style?.fontFamily, 'RedHatDisplay');
    expect(moneyPrefixTextWidget.style?.fontSize, 14.0);

    final centsTextWidget = textFinder.last.evaluate().single.widget as Text;
    expect(centsTextWidget.data, '00');
    expect(centsTextWidget.style?.fontFamily, 'RedHatDisplay');
    expect(centsTextWidget.style?.fontSize, 10.0);
  });

  testWidgets('When action button is clicked then the callback onQuantityChange is called',
      (WidgetTester tester) async {
    await tester.pumpWidget(app);
    await tester.pump();

    final finder = find.descendant(of: find.byType(ProductActionButton), matching: find.byType(InkWell));
    expect(finder, findsOneWidget);
    await tester.tap(finder);
    await tester.pump();
    expect(quantity, 1);
  });
}
