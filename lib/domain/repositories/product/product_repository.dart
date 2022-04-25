import 'package:dartz/dartz.dart';
import 'package:e_commerce_desafio/domain/entities/response/response_list.dart';
import 'package:e_commerce_desafio/infra/failure/failure.dart';

abstract class ProductRepository {
  Future<Either<Failure, ResponseList>> getProducts(int page);
}
