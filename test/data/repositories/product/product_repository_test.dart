import 'package:e_commerce_desafio/data/data_source/product/produtct_remote_datasource.dart';
import 'package:e_commerce_desafio/data/repositories/product/product_repository_impl.dart';
import 'package:e_commerce_desafio/domain/entities/response/response_list.dart';
import 'package:e_commerce_desafio/domain/repositories/product/product_repository.dart';
import 'package:e_commerce_desafio/infra/failure/failure.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../fixtures/product_fixture.dart';
import '../../../mocks/mocks.dart';

void main() {
  late ProductDataSource dataSource;
  late ProductRepository repository;

  group('test product repository', () {
    setUp(() {
      dataSource = ProductDataSourceMock();
      repository = ProductRepositoryImpl(dataSource: dataSource);
    });

    test('When try get list products then return a right ResponseList', () async {
      const _page = 0;
      when(dataSource.getProducts(_page)).thenAnswer((_) async => responseProductList);

      final _response = await repository.getProducts(_page);
      final _result = _response.fold((l) => l, (r) => r);
      expect(_result, isA<ResponseList>());
    });

    test('When try get list products then either left ServerFailure', () async {
      const _page = 0;
      when(dataSource.getProducts(_page)).thenThrow((_) async => Exception('error'));

      final _response = await repository.getProducts(_page);
      final _result = _response.fold((l) => l, (r) => r);
      expect(_result, isA<ServerFailure>());
    });
  });
}
