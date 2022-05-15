class UnitValueEntity {
  final String unit;
  final double? value;

  UnitValueEntity({
    required this.unit,
    this.value,
  });
}

class NutritionalTableEntity {
  final UnitValueEntity moisture;
  final UnitValueEntity energy;
  final UnitValueEntity proteins;
  final UnitValueEntity lipids;
  final UnitValueEntity carbohydrates;
  final UnitValueEntity fibers;

  NutritionalTableEntity({
    required this.moisture,
    required this.energy,
    required this.proteins,
    required this.lipids,
    required this.carbohydrates,
    required this.fibers,
  });
}

class ProductEntity {
  final String id;
  final String name;
  final String description;
  final String image;
  final double price;
  final String unit;
  final int stock;
  final int? quantity;
  final NutritionalTableEntity? nutritionalTable;

  ProductEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.price,
    required this.unit,
    required this.stock,
    this.nutritionalTable,
    this.quantity,
  });
}
