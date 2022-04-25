import 'package:dartz/dartz.dart';
import 'package:e_commerce_desafio/domain/entities/response/response_list.dart';
import 'package:e_commerce_desafio/domain/repositories/product/product_repository.dart';
import 'package:e_commerce_desafio/domain/use-cases/product/get_products.dart';
import 'package:e_commerce_desafio/infra/failure/failure.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../fixtures/product_fixture.dart';
import 'get_product_test.mocks.dart';

@GenerateMocks([ProductRepository])
void main() {
  late ProductRepository repository;
  late GetProductsUseCase useCase;

  setUp(() {
    repository = MockProductRepository();
    useCase = GetProductsUseCase(repository: repository);
  });

  test('When try get list products then return a right ResponseList', () async {
    const _page = 0;
    when(repository.getProducts(_page)).thenAnswer((_) async => Right(responseProductList));

    final _response = await useCase.call(_page);
    final _result = _response.fold((l) => l, (r) => r);
    expect(_result, isA<ResponseList>());
  });

  test('When try get list products then either left ServerFailure', () async {
    const _page = 0;
    when(repository.getProducts(_page)).thenAnswer((_) async => Left(ServerFailure(message: 'error')));

    final _response = await useCase.call(_page);
    final _result = _response.fold((l) => l, (r) => r);
    expect(_result, isA<ServerFailure>());
  });
}
