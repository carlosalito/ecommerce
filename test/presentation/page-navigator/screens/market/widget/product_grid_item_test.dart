import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_desafio/di/injectable.dart';
import 'package:e_commerce_desafio/presentation/page-navigator/screens/market/widget/product_grid_item.dart';
import 'package:e_commerce_desafio/presentation/page-navigator/screens/market/widget/product_image_error.dart';
import 'package:e_commerce_desafio/presentation/page-navigator/screens/market/widget/product_price_action.dart';
import 'package:file/file.dart';
import 'package:file/memory.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../../fixtures/product_fixture.dart';
import '../../../../../fixtures/transparent_image.dart';
import '../../setup_app.dart';
import 'product_grid_item_test.mocks.dart';

@GenerateMocks([DefaultCacheManager])
void main() {
  late MaterialApp app;
  late DefaultCacheManager _mockDefaultCacheManager;
  late File file;

  setUp(() {
    getIt.registerSingleton<DefaultCacheManager>(MockDefaultCacheManager());
    _mockDefaultCacheManager = getIt<DefaultCacheManager>();

    file = MemoryFileSystem().systemTempDirectory.childFile('test.jpg');
    file.writeAsBytesSync(transparentImage);

    app = makeApp(
      ProductGridItem(
        product: fakeProduct,
        onQuantityChange: (_) {},
      ),
    );
  });

  testWidgets('check integrity grid item widget', (WidgetTester tester) async {
    when(_mockDefaultCacheManager.getImageFile(
      fakeProduct.image,
      key: null,
      headers: null,
      withProgress: true,
      maxHeight: null,
      maxWidth: null,
    )).thenAnswer((_) async* {
      yield FileInfo(file, FileSource.Cache, DateTime(2050), fakeProduct.image);
    });

    await tester.pumpWidget(app);
    await tester.pump();
    await tester.pump();

    final imageFinder = find.byWidgetPredicate((widget) => widget is CachedNetworkImage);
    expect(imageFinder, findsOneWidget);

    final productPriceActionFinder = find.byWidgetPredicate((widget) => widget is ProductPriceAction);
    expect(productPriceActionFinder, findsOneWidget);

    final textFinder = find.byWidgetPredicate((widget) => widget is Text);
    expect(textFinder, findsNWidgets(4));

    final productTextWidget = textFinder.first.evaluate().single.widget as Text;
    expect(productTextWidget.data, 'Laranja');
    expect(productTextWidget.style?.fontFamily, 'RedHatDisplay');
    expect(productTextWidget.style?.fontSize, 18.0);
  });

  testWidgets('check if cached image load image with success', (WidgetTester tester) async {
    when(_mockDefaultCacheManager.getImageFile(
      fakeProduct.image,
      key: null,
      headers: null,
      withProgress: true,
      maxHeight: null,
      maxWidth: null,
    )).thenAnswer((_) async* {
      yield FileInfo(file, FileSource.Cache, DateTime(2050), fakeProduct.image);
    });

    await tester.pumpWidget(app);
    await tester.pump();
    await tester.pump();

    final imageFinder = find.byWidgetPredicate((widget) => widget is CircularProgressIndicator);
    expect(imageFinder, findsOneWidget);

    final productPriceActionFinder = find.byWidgetPredicate((widget) => widget is ProductImageError);
    expect(productPriceActionFinder, findsNothing);
  });

  testWidgets('when cached image load image with error then widget error is showed', (WidgetTester tester) async {
    when(_mockDefaultCacheManager.getImageFile(
      fakeProduct.image,
      key: null,
      headers: null,
      withProgress: true,
      maxHeight: null,
      maxWidth: null,
    )).thenThrow(Exception('error'));

    await tester.pumpWidget(app);
    await tester.pump();
    await tester.pump();

    final productPriceActionFinder = find.byWidgetPredicate((widget) => widget is ProductImageError);
    expect(productPriceActionFinder, findsOneWidget);
  });

  testWidgets('when item is clicked then navigate to product detail screen', (WidgetTester tester) async {});
}
