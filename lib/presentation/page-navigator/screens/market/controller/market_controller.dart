import 'package:e_commerce_desafio/domain/entities/product/product_entity.dart';
import 'package:e_commerce_desafio/domain/entities/response/response_list.dart';
import 'package:e_commerce_desafio/domain/use-cases/product/get_products.dart';
import 'package:e_commerce_desafio/presentation/app/app_config.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

part 'market_controller.g.dart';

@injectable
class MarketController = _MarketControllerBase with _$MarketController;

abstract class _MarketControllerBase with Store {
  final GetProductsUseCase _getProductsUseCase;

  _MarketControllerBase({required GetProductsUseCase getProductsUseCase}) : _getProductsUseCase = getProductsUseCase;

  @observable
  PageInfoResponse pageInfo = PageInfoResponse(totalPages: 0, totalRows: 0);

  @observable
  List<ProductEntity> products = ObservableList.of([]);

  @observable
  int page = 0;

  void _setProducts(List<ProductEntity> list) {
    if (page == 0) {
      products = ObservableList.of(list);
    } else {
      products = ObservableList.of([...products, ...list]);
    }
  }

  void _setPageInfo(PageInfoResponse value) {
    pageInfo = value;
  }

  void _setResult(ResponseList<ProductEntity> result) {
    _setPageInfo(result.pageInfo);
    _setProducts(result.data);
  }

  @action
  Future<void> list() async {
    final _response = await _getProductsUseCase.call(page);
    _response.fold((l) => AppConfig.instance.streamError.add(l), (data) => _setResult(data));
  }
}
