import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:e_commerce_desafio/domain/use-cases/product/get_products.dart';
import 'package:e_commerce_desafio/infra/failure/failure.dart';
import 'package:e_commerce_desafio/presentation/app/app_config.dart';
import 'package:e_commerce_desafio/presentation/page-navigator/screens/market/controller/market_controller.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../../fixtures/product_fixture.dart';
import 'market_controller_test.mocks.dart';

@GenerateMocks([GetProductsUseCase])
void main() {
  late GetProductsUseCase useCase;
  late MarketController controller;

  setUp(() {
    useCase = MockGetProductsUseCase();
    controller = MarketController(getProductsUseCase: useCase);

    final StreamController<Failure?> streamError = StreamController<Failure?>.broadcast();

    AppConfig(
      streamError: streamError,
      onDispose: () {
        streamError.close();
      },
    );
  });

  test('When call list method then we have a valid ProductEntity list', () async {
    when(useCase.call(0)).thenAnswer((_) async => Right(responseProductList));

    expect(controller.products.isEmpty, true);
    await controller.list();
    expect(controller.products.length, responseProductList.data.length);
  });

  test('When call list method then an either left data is returned', () async {
    when(useCase.call(0)).thenAnswer((_) async => Left(ServerFailure(message: 'error')));

    expect(controller.products.isEmpty, true);
    await controller.list();
    final _failure = await AppConfig.instance.streamError.stream.length;

    expect(controller.products.isEmpty, true);
    expect(_failure, isA<ServerFailure>());
  });
}
