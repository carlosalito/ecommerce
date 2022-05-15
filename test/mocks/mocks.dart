import 'package:dio/dio.dart';
import 'package:e_commerce_desafio/data/data_source/clients/http_client.dart';
import 'package:e_commerce_desafio/data/data_source/product/produtct_remote_datasource.dart';
import 'package:e_commerce_desafio/domain/entities/product/product_entity.dart';
import 'package:e_commerce_desafio/domain/entities/response/response_list.dart';
import 'package:mockito/mockito.dart';

class _FakeResponse<T> extends Fake implements Response<T> {}

class _FakeResponseList<T> extends Fake implements ResponseList<T> {}

class HttpClientMock extends Mock implements HttpClient {
  @override
  Future<Response> get(String endpoint) =>
      super.noSuchMethod(Invocation.method(#get, [endpoint]), returnValue: Future.value(_FakeResponse()));
}

class ProductDataSourceMock extends Mock implements ProductDataSource {
  @override
  Future<ResponseList<ProductEntity>> getProducts(int page) =>
      super.noSuchMethod(Invocation.method(#getProducts, [page]),
          returnValue: Future.value(_FakeResponseList<ProductEntity>()));
}
