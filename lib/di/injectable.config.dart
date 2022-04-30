// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../data/data_source/clients/http_client.dart' as _i4;
import '../data/data_source/clients/third_modules.dart' as _i12;
import '../data/data_source/product/produtct_remote_datasource.dart' as _i6;
import '../data/data_source/product/produtct_remote_datasource_impl.dart'
    as _i7;
import '../data/repositories/product/product_repository_impl.dart' as _i9;
import '../domain/repositories/product/product_repository.dart' as _i8;
import '../domain/use-cases/product/get_products.dart' as _i10;
import '../presentation/page-navigator/controller/page_navigator_controller.dart'
    as _i5;
import '../presentation/page-navigator/screens/market/controller/market_controller.dart'
    as _i11; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final registerModule = _$RegisterModule();
  gh.factory<_i3.Dio>(() => registerModule.dio());
  gh.factory<_i4.HttpClient>(() => _i4.HttpClient(dio: get<_i3.Dio>()));
  gh.singleton<_i5.PageNavigatorController>(_i5.PageNavigatorController());
  gh.factory<_i6.ProductDataSource>(
      () => _i7.ProductDataSourceImpl(http: get<_i4.HttpClient>()));
  gh.factory<_i8.ProductRepository>(() =>
      _i9.ProductRepositoryImpl(dataSource: get<_i6.ProductDataSource>()));
  gh.factory<_i10.GetProductsUseCase>(
      () => _i10.GetProductsUseCase(repository: get<_i8.ProductRepository>()));
  gh.factory<_i11.MarketController>(() => _i11.MarketController(
      getProductsUseCase: get<_i10.GetProductsUseCase>()));
  return get;
}

class _$RegisterModule extends _i12.RegisterModule {}
