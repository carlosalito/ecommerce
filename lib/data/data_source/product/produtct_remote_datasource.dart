import 'package:e_commerce_desafio/domain/entities/product/product_entity.dart';
import 'package:e_commerce_desafio/domain/entities/response/response_list.dart';

abstract class ProductDataSource {
  Future<ResponseList<ProductEntity>> getProducts(int page);
}
