import 'package:e_commerce_desafio/data/data_source/clients/http_client.dart';
import 'package:e_commerce_desafio/data/models/products/products_model.dart';
import 'package:e_commerce_desafio/domain/entities/product/product_entity.dart';
import 'package:e_commerce_desafio/domain/entities/response/response_list.dart';
import 'package:e_commerce_desafio/infra/constants/endpoints.dart';
import 'package:injectable/injectable.dart';

import 'produtct_remote_datasource.dart';

@Injectable(as: ProductDataSource)
class ProductDataSourceImpl implements ProductDataSource {
  final HttpClient _http;

  ProductDataSourceImpl({required HttpClient http}) : _http = http;

  @override
  Future<ResponseList<ProductEntity>> getProducts(int page) async {
    try {
      final _response = await _http.get('${Endpoints.getProducts}/$page');
      final _pageInfo = _response.data['pageInfo'];
      final _data = (_response.data['data'] as List).map((json) => ProductModel.fromJson(json).toEntity()).toList();

      final _result = ResponseList<ProductEntity>(
          pageInfo: PageInfoResponse(
            totalPages: (_pageInfo['totalPages'] as num).toInt(),
            totalRows: (_pageInfo['totalRows'] as num).toInt(),
          ),
          data: _data);
      return _result;
    } catch (e) {
      rethrow;
    }
  }
}
