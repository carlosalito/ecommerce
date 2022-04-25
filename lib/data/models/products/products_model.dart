import 'package:e_commerce_desafio/domain/entities/product/product_entity.dart';
import 'package:json_annotation/json_annotation.dart';

import 'products_mapper.dart';

part 'products_model.g.dart';

@JsonSerializable(anyMap: true)
class UnitValueModel extends UnitValueEntity {
  @JsonKey(name: 'unidade')
  final String unitModel;

  @JsonKey(name: 'valor')
  final double? valueModel;

  UnitValueModel({required this.unitModel, required this.valueModel})
      : super(
          unit: unitModel,
          value: valueModel,
        );

  factory UnitValueModel.fromJson(Map json) => _$UnitValueModelFromJson(json);
  Map<String, dynamic> toJson() => _$UnitValueModelToJson(this);
  factory UnitValueModel.fromEntity(UnitValueEntity entity) => $UnitValueModelFromEntity(entity);
  UnitValueEntity toEntity() => $UnitValueModelToEntity(this);
}

@JsonSerializable(anyMap: true, explicitToJson: true)
class NutritionalTableModel extends NutritionalTableEntity {
  @JsonKey(name: 'umidade')
  final UnitValueModel moistureModel;

  @JsonKey(name: 'energia')
  final UnitValueModel energyModel;

  @JsonKey(name: 'proteinas')
  final UnitValueModel proteinsModel;

  @JsonKey(name: 'lipidios')
  final UnitValueModel lipidsModel;

  @JsonKey(name: 'carbohidratos')
  final UnitValueModel carbohydratesModel;

  @JsonKey(name: 'fibras')
  final UnitValueModel fibersModel;

  NutritionalTableModel({
    required this.moistureModel,
    required this.energyModel,
    required this.proteinsModel,
    required this.lipidsModel,
    required this.carbohydratesModel,
    required this.fibersModel,
  }) : super(
          moisture: moistureModel,
          energy: energyModel,
          proteins: proteinsModel,
          lipids: lipidsModel,
          carbohydrates: carbohydratesModel,
          fibers: fibersModel,
        );

  factory NutritionalTableModel.fromJson(Map json) => _$NutritionalTableModelFromJson(json);
  Map<String, dynamic> toJson() => _$NutritionalTableModelToJson(this);
  factory NutritionalTableModel.fromEntity(NutritionalTableEntity entity) => $NutritionalTableModelFromEntity(entity);
  NutritionalTableEntity toEntity() => $NutritionalTableModelToEntity(this);
}

@JsonSerializable(anyMap: true, explicitToJson: true)
class ProductModel extends ProductEntity {
  @JsonKey(name: 'nome')
  final String nameModel;

  @JsonKey(name: 'descricao')
  final String descriptionModel;

  @JsonKey(name: 'imagem')
  final String imageModel;

  @JsonKey(name: 'preco')
  final double priceModel;

  @JsonKey(name: 'unidade')
  final String unitModel;

  @JsonKey(name: 'estoque')
  final double stockModel;

  @JsonKey(name: 'tabelaNutricional')
  final NutritionalTableModel? nutritionalTableModel;

  ProductModel({
    required String id,
    required this.nameModel,
    required this.descriptionModel,
    required this.priceModel,
    required this.imageModel,
    required this.unitModel,
    required this.stockModel,
    this.nutritionalTableModel,
  }) : super(
          id: id,
          name: nameModel,
          description: descriptionModel,
          price: priceModel,
          unit: unitModel,
          image: imageModel,
          stock: stockModel,
          nutritionalTable: nutritionalTableModel,
        );

  factory ProductModel.fromJson(Map json) => _$ProductModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProductModelToJson(this);
  factory ProductModel.fromEntity(ProductEntity entity) => $ProductModelFromEntity(entity);
  ProductEntity toEntity() => $ProductModelToEntity(this);
}
