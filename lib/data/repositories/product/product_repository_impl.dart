import 'package:dartz/dartz.dart';
import 'package:e_commerce_desafio/data/data_source/product/produtct_remote_datasource.dart';
import 'package:e_commerce_desafio/domain/entities/product/product_entity.dart';
import 'package:e_commerce_desafio/domain/entities/response/response_list.dart';
import 'package:e_commerce_desafio/domain/repositories/product/product_repository.dart';
import 'package:e_commerce_desafio/infra/failure/failure.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ProductRepository)
class ProductRepositoryImpl implements ProductRepository {
  final ProductDataSource _dataSource;

  ProductRepositoryImpl({required ProductDataSource dataSource}) : _dataSource = dataSource;

  @override
  Future<Either<Failure, ResponseList<ProductEntity>>> getProducts(int page) async {
    try {
      final _response = await _dataSource.getProducts(page);
      return right(_response);
    } catch (e) {
      return left(ServerFailure(message: 'genericListError'));
    }
  }
}
