import 'package:e_commerce_desafio/domain/entities/response/response_list.dart';

abstract class ProductDataSource {
  Future<ResponseList> getProducts(int page);
}
