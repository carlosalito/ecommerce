import 'package:dartz/dartz.dart';
import 'package:e_commerce_desafio/domain/entities/product/product_entity.dart';
import 'package:e_commerce_desafio/domain/entities/response/response_list.dart';
import 'package:e_commerce_desafio/domain/repositories/product/product_repository.dart';
import 'package:e_commerce_desafio/infra/failure/failure.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetProductsUseCase {
  final ProductRepository _repository;

  GetProductsUseCase({required ProductRepository repository}) : _repository = repository;

  Future<Either<Failure, ResponseList<ProductEntity>>> call(int page) async {
    return _repository.getProducts(page);
  }
}
