import 'package:e_commerce_desafio/data/models/products/products_model.dart';
import 'package:e_commerce_desafio/domain/entities/product/product_entity.dart';

UnitValueModel $UnitValueModelFromEntity(UnitValueEntity entity) {
  return UnitValueModel(
    unitModel: entity.unit,
    valueModel: entity.value,
  );
}

UnitValueEntity $UnitValueModelToEntity(UnitValueModel model) {
  return UnitValueEntity(
    unit: model.unitModel,
    value: model.valueModel,
  );
}

NutritionalTableModel $NutritionalTableModelFromEntity(NutritionalTableEntity entity) {
  return NutritionalTableModel(
    moistureModel: $UnitValueModelFromEntity(entity.moisture),
    energyModel: $UnitValueModelFromEntity(entity.energy),
    proteinsModel: $UnitValueModelFromEntity(entity.proteins),
    lipidsModel: $UnitValueModelFromEntity(entity.lipids),
    carbohydratesModel: $UnitValueModelFromEntity(entity.carbohydrates),
    fibersModel: $UnitValueModelFromEntity(entity.fibers),
  );
}

NutritionalTableEntity $NutritionalTableModelToEntity(NutritionalTableModel model) {
  return NutritionalTableEntity(
    moisture: $UnitValueModelToEntity(model.moistureModel),
    energy: $UnitValueModelToEntity(model.energyModel),
    proteins: $UnitValueModelToEntity(model.proteinsModel),
    lipids: $UnitValueModelToEntity(model.lipidsModel),
    carbohydrates: $UnitValueModelToEntity(model.carbohydratesModel),
    fibers: $UnitValueModelToEntity(model.fibersModel),
  );
}

ProductModel $ProductModelFromEntity(ProductEntity entity) {
  return ProductModel(
    id: entity.id,
    nameModel: entity.name,
    descriptionModel: entity.description,
    priceModel: entity.price,
    imageModel: entity.image,
    unitModel: entity.unit,
    stockModel: entity.stock,
    nutritionalTableModel:
        entity.nutritionalTable == null ? null : $NutritionalTableModelFromEntity(entity.nutritionalTable!),
  );
}

ProductEntity $ProductModelToEntity(ProductModel model) {
  return ProductEntity(
    id: model.id,
    name: model.nameModel,
    description: model.descriptionModel,
    image: model.imageModel,
    price: model.priceModel,
    unit: model.unitModel,
    stock: model.stockModel,
    nutritionalTable:
        model.nutritionalTableModel == null ? null : $NutritionalTableModelToEntity(model.nutritionalTableModel!),
  );
}
