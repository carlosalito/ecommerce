import 'package:e_commerce_desafio/presentation/page-navigator/screens/market/widget/product_action_button.dart';
import 'package:e_commerce_desafio/presentation/page-navigator/screens/market/widget/product_action_short_button.dart';
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

  void _setQuantity(int value) {
    quantity = value;
  }

  void _resetQuantity() {
    quantity = 0;
  }

  setUp(() {
    app = makeApp(
      ProductActionButton(
        product: fakeProduct,
        onQuantityChange: (_) => _incrementQuantity(),
      ),
    );
  });

  testWidgets('check integrity ProductActionButton widget when product quantity is NULL', (WidgetTester tester) async {
    await tester.pumpWidget(app);
    await tester.pump();

    final finder = find.byWidgetPredicate((widget) => widget is ProductActionShortButton);
    expect(finder, findsOneWidget);
    final button = finder.first.evaluate().first.widget as ProductActionShortButton;
    expect(button.icon, Icons.add);
  });

  testWidgets('check integrity ProductActionButton widget when product quantity is ZERO', (WidgetTester tester) async {
    app = makeApp(
      ProductActionButton(
        product: fakeProductZeroQuant,
        onQuantityChange: (_) => _incrementQuantity(),
      ),
    );
    await tester.pumpWidget(app);
    await tester.pump();

    final finder = find.byWidgetPredicate((widget) => widget is ProductActionShortButton);
    expect(finder, findsOneWidget);
    final button = finder.first.evaluate().first.widget as ProductActionShortButton;
    expect(button.icon, Icons.add);
  });

  testWidgets('check integrity ProductActionButton widget when product quantity is great than ZERO',
      (WidgetTester tester) async {
    app = makeApp(
      ProductActionButton(
        product: fakeProductQuant,
        onQuantityChange: (_) => _incrementQuantity(),
      ),
    );
    await tester.pumpWidget(app);
    await tester.pump();

    final finder = find.byWidgetPredicate((widget) => widget is ProductActionShortButton);
    expect(finder, findsNWidgets(2));
    final buttonRemove = finder.first.evaluate().first.widget as ProductActionShortButton;
    expect(buttonRemove.icon, Icons.remove);
    final buttonAdd = finder.at(1).evaluate().first.widget as ProductActionShortButton;
    expect(buttonAdd.icon, Icons.add);
    final finderText = find.byWidgetPredicate((widget) => widget is Text);
    expect(finderText, findsOneWidget);
    final text = finderText.first.evaluate().first.widget as Text;
    expect(text.data, '01');
    expect(text.style?.fontSize, 14);
    expect(text.style?.fontFamily, 'TTNormsPro');
  });

  testWidgets(
      'When product quantity is great than Zero and less than stock and add button is clicked '
      'then the callback onQuantityChange is called and returns quantity + 1', (WidgetTester tester) async {
    _resetQuantity();
    app = makeApp(
      ProductActionButton(
        product: fakeProductQuant,
        onQuantityChange: (int value) => _setQuantity(value),
      ),
    );
    await tester.pumpWidget(app);
    await tester.pump();

    final finder = find.byWidgetPredicate((widget) => widget is ProductActionShortButton);
    expect(finder, findsNWidgets(2));

    await tester.tap(finder.last);
    expect(quantity, 2);
  });

  testWidgets(
      'When product quantity is great than Zero and less than stock and remove button is clicked '
      'then the callback onQuantityChange is called and returns quantity - 1', (WidgetTester tester) async {
    _resetQuantity();
    app = makeApp(
      ProductActionButton(
        product: fakeProductQuant,
        onQuantityChange: (int value) => _setQuantity(value),
      ),
    );
    await tester.pumpWidget(app);
    await tester.pump();

    final finder = find.byWidgetPredicate((widget) => widget is ProductActionShortButton);
    expect(finder, findsNWidgets(2));

    await tester.tap(finder.first);
    expect(quantity, 0);
  });

  testWidgets(
      'When product quantity is equals to stock and add button is clicked '
      'then the callback onQuantityChange is not called', (WidgetTester tester) async {
    _resetQuantity();
    app = makeApp(
      ProductActionButton(
        product: fakeProductQuantEqualStock,
        onQuantityChange: (int value) => _setQuantity(value),
      ),
    );
    await tester.pumpWidget(app);
    await tester.pump();

    final finder = find.byWidgetPredicate((widget) => widget is ProductActionShortButton);
    expect(finder, findsNWidgets(2));

    await tester.tap(finder.last);
    expect(quantity, 0);
  });

  testWidgets(
      'When product quantity is equals to ZERO and button is clicked '
      'then the callback onQuantityChange is called and returns 1', (WidgetTester tester) async {
    app = makeApp(
      ProductActionButton(
        product: fakeProductZeroQuant,
        onQuantityChange: (int value) => _setQuantity(value),
      ),
    );
    await tester.pumpWidget(app);
    await tester.pump();

    final finder = find.byWidgetPredicate((widget) => widget is ProductActionShortButton);
    expect(finder, findsOneWidget);

    await tester.tap(finder.first);
    expect(quantity, 1);
  });
}
