// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UnitValueModel _$UnitValueModelFromJson(Map json) => UnitValueModel(
      unitModel: json['unidade'] as String,
      valueModel: (json['valor'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$UnitValueModelToJson(UnitValueModel instance) =>
    <String, dynamic>{
      'unidade': instance.unitModel,
      'valor': instance.valueModel,
    };

NutritionalTableModel _$NutritionalTableModelFromJson(Map json) =>
    NutritionalTableModel(
      moistureModel: UnitValueModel.fromJson(json['umidade'] as Map),
      energyModel: UnitValueModel.fromJson(json['energia'] as Map),
      proteinsModel: UnitValueModel.fromJson(json['proteinas'] as Map),
      lipidsModel: UnitValueModel.fromJson(json['lipidios'] as Map),
      carbohydratesModel: UnitValueModel.fromJson(json['carbohidratos'] as Map),
      fibersModel: UnitValueModel.fromJson(json['fibras'] as Map),
    );

Map<String, dynamic> _$NutritionalTableModelToJson(
        NutritionalTableModel instance) =>
    <String, dynamic>{
      'umidade': instance.moistureModel.toJson(),
      'energia': instance.energyModel.toJson(),
      'proteinas': instance.proteinsModel.toJson(),
      'lipidios': instance.lipidsModel.toJson(),
      'carbohidratos': instance.carbohydratesModel.toJson(),
      'fibras': instance.fibersModel.toJson(),
    };

ProductModel _$ProductModelFromJson(Map json) => ProductModel(
      id: json['id'] as String,
      nameModel: json['nome'] as String,
      descriptionModel: json['descricao'] as String,
      priceModel: (json['preco'] as num).toDouble(),
      imageModel: json['imagem'] as String,
      unitModel: json['unidade'] as String,
      stockModel: (json['estoque'] as num).toDouble(),
      nutritionalTableModel: json['tabelaNutricional'] == null
          ? null
          : NutritionalTableModel.fromJson(json['tabelaNutricional'] as Map),
    );

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nome': instance.nameModel,
      'descricao': instance.descriptionModel,
      'imagem': instance.imageModel,
      'preco': instance.priceModel,
      'unidade': instance.unitModel,
      'estoque': instance.stockModel,
      'tabelaNutricional': instance.nutritionalTableModel?.toJson(),
    };
