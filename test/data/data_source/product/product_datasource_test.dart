import 'package:dio/dio.dart';
import 'package:e_commerce_desafio/data/data_source/clients/http_client.dart';
import 'package:e_commerce_desafio/data/data_source/product/produtct_remote_datasource.dart';
import 'package:e_commerce_desafio/data/data_source/product/produtct_remote_datasource_impl.dart';
import 'package:e_commerce_desafio/domain/entities/response/response_list.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../fixtures/product_fixture.dart';
import '../../../mocks/mocks.dart';

void main() {
  late HttpClient httpClient;
  late ProductDataSource dataSource;

  group('test product datasource', () {
    setUp(() {
      httpClient = HttpClientMock();
      dataSource = ProductDataSourceImpl(http: httpClient);
    });

    test('When try get list products then return a ResponseList with a ProductEntity data list', () async {
      final _fakeHttpResponse = fakeProductHttpResponse;
      const _page = 0;
      const _path = 'https://demo8351173.mockable.io/products/0';

      when(httpClient.get(_path)).thenAnswer(
        (_) async => Response(data: _fakeHttpResponse, requestOptions: RequestOptions(path: _path)),
      );

      final _response = await dataSource.getProducts(_page);
      expect(_response, isA<ResponseList>());
      expect(_response.data.length, 2);
      expect(_response.pageInfo.totalRows, 11);
      expect(_response.data[0].id, fakeProductHttpResponse['data'][0]['id']);
    });

    test('When try get list products then return a ResponseList with a empty data list', () async {
      final _fakeHttpResponse = fakeEmptyProductHttpResponse;
      const _page = 0;
      const _path = 'https://demo8351173.mockable.io/products/0';

      when(httpClient.get(_path)).thenAnswer(
        (_) async => Response(data: _fakeHttpResponse, requestOptions: RequestOptions(path: _path)),
      );

      final _response = await dataSource.getProducts(_page);
      expect(_response, isA<ResponseList>());
      expect(_response.data.isEmpty, true);
      expect(_response.pageInfo.totalRows, 0);
    });

    test('When try get list products then throw a Exception', () async {
      const _page = 0;
      const _path = 'https://demo8351173.mockable.io/products/0';

      when(httpClient.get(_path)).thenThrow(Exception('error'));
      expect(() async => await dataSource.getProducts(_page), throwsA(isA<Exception>()));
    });
  });
}
