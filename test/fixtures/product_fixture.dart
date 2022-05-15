import 'package:e_commerce_desafio/domain/entities/product/product_entity.dart';
import 'package:e_commerce_desafio/domain/entities/response/response_list.dart';

Map<String, dynamic> fakeEmptyProductHttpResponse = {
  "pageInfo": {"totalPages": 0, "totalRows": 0},
  "data": []
};

Map<String, dynamic> fakeProductHttpResponse = {
  "pageInfo": {"totalPages": 2, "totalRows": 11},
  "data": [
    {
      "id": "4e7b60cc-f706-48d0-816e-4a58d8a84ae9",
      "nome": "Laranja",
      "descricao":
          "A laranja pera, também conhecida por laranja pera rio, é um das 600 variedades dessa fruta que existem no mundo. Conhecida pelo seu sabor doce e pouco ácido, pode ser consumida tanto ao natural como no preparo de sucos e doces, ou mesmo como ingrediente em pratos salgados, como o famoso pato com laranja.",
      "imagem":
          "https://firebasestorage.googleapis.com/v0/b/idheaconsultv2.appspot.com/o/mock%2Flaranja_pera.png?alt=media&token=8ea068a9-7324-42c4-9b8a-782e0d27deaf",
      "preco": 9.89,
      "unidade": "kg",
      "estoque": 150,
      "tabelaNutricional": {
        "umidade": {"unidade": "%", "valor": 89.6},
        "energia": {"unidade": "kcal", "valor": 37},
        "proteinas": {"unidade": "g", "valor": 1.0},
        "lipidios": {"unidade": "g", "valor": 0.1},
        "carbohidratos": {"unidade": "g", "valor": 8.9},
        "fibras": {"unidade": "g", "valor": 0.8}
      }
    },
    {
      "id": "c6961578-ea13-4665-870a-f25f49854ef4",
      "nome": "Laranja Orgânica",
      "descricao":
          "A laranja pera, também conhecida por laranja pera rio, é um das 600 variedades dessa fruta que existem no mundo. Conhecida pelo seu sabor doce e pouco ácido, pode ser consumida tanto ao natural como no preparo de sucos e doces, ou mesmo como ingrediente em pratos salgados, como o famoso pato com laranja.",
      "imagem":
          "https://firebasestorage.googleapis.com/v0/b/idheaconsultv2.appspot.com/o/mock%2Flaranja_pera.png?alt=media&token=8ea068a9-7324-42c4-9b8a-782e0d27deaf",
      "preco": 12.89,
      "unidade": "kg",
      "estoque": 50,
      "tabelaNutricional": {
        "umidade": {"unidade": "%", "valor": 89.6},
        "energia": {"unidade": "kcal", "valor": 37},
        "proteinas": {"unidade": "g", "valor": 1.0},
        "lipidios": {"unidade": "g", "valor": 0.1},
        "carbohidratos": {"unidade": "g", "valor": 8.9},
        "fibras": {"unidade": "g", "valor": 0.8}
      }
    }
  ]
};

ProductEntity fakeProduct = ProductEntity(
  id: "4e7b60cc-f706-48d0-816e-4a58d8a84ae9",
  name: 'Laranja',
  description: 'descrição da laranja',
  image:
      'https://firebasestorage.googleapis.com/v0/b/idheaconsultv2.appspot.com/o/mock%2Flaranja_pera.png?alt=media&token=8ea068a9-7324-42c4-9b8a-782e0d27deaf',
  price: 1.0,
  unit: 'Kg',
  stock: 100,
  nutritionalTable: NutritionalTableEntity(
    moisture: UnitValueEntity(unit: 'un', value: 1.1),
    energy: UnitValueEntity(unit: 'un', value: 1.1),
    proteins: UnitValueEntity(unit: 'un', value: 1.1),
    lipids: UnitValueEntity(unit: 'un', value: 1.1),
    carbohydrates: UnitValueEntity(unit: 'un', value: 1.1),
    fibers: UnitValueEntity(unit: 'un', value: 1.1),
  ),
);

ProductEntity fakeProductZeroQuant = ProductEntity(
  id: "4e7b60cc-f706-48d0-816e-4a58d8a84ae9",
  name: 'Laranja',
  description: 'descrição da laranja',
  image:
      'https://firebasestorage.googleapis.com/v0/b/idheaconsultv2.appspot.com/o/mock%2Flaranja_pera.png?alt=media&token=8ea068a9-7324-42c4-9b8a-782e0d27deaf',
  price: 1.0,
  unit: 'Kg',
  stock: 100,
  quantity: 0,
  nutritionalTable: NutritionalTableEntity(
    moisture: UnitValueEntity(unit: 'un', value: 1.1),
    energy: UnitValueEntity(unit: 'un', value: 1.1),
    proteins: UnitValueEntity(unit: 'un', value: 1.1),
    lipids: UnitValueEntity(unit: 'un', value: 1.1),
    carbohydrates: UnitValueEntity(unit: 'un', value: 1.1),
    fibers: UnitValueEntity(unit: 'un', value: 1.1),
  ),
);

ProductEntity fakeProductQuant = ProductEntity(
  id: "4e7b60cc-f706-48d0-816e-4a58d8a84ae9",
  name: 'Laranja',
  description: 'descrição da laranja',
  image:
      'https://firebasestorage.googleapis.com/v0/b/idheaconsultv2.appspot.com/o/mock%2Flaranja_pera.png?alt=media&token=8ea068a9-7324-42c4-9b8a-782e0d27deaf',
  price: 1.0,
  unit: 'Kg',
  stock: 2,
  quantity: 1,
  nutritionalTable: NutritionalTableEntity(
    moisture: UnitValueEntity(unit: 'un', value: 1.1),
    energy: UnitValueEntity(unit: 'un', value: 1.1),
    proteins: UnitValueEntity(unit: 'un', value: 1.1),
    lipids: UnitValueEntity(unit: 'un', value: 1.1),
    carbohydrates: UnitValueEntity(unit: 'un', value: 1.1),
    fibers: UnitValueEntity(unit: 'un', value: 1.1),
  ),
);

ProductEntity fakeProductQuantEqualStock = ProductEntity(
  id: "4e7b60cc-f706-48d0-816e-4a58d8a84ae9",
  name: 'Laranja',
  description: 'descrição da laranja',
  image:
      'https://firebasestorage.googleapis.com/v0/b/idheaconsultv2.appspot.com/o/mock%2Flaranja_pera.png?alt=media&token=8ea068a9-7324-42c4-9b8a-782e0d27deaf',
  price: 1.0,
  unit: 'Kg',
  stock: 2,
  quantity: 2,
  nutritionalTable: NutritionalTableEntity(
    moisture: UnitValueEntity(unit: 'un', value: 1.1),
    energy: UnitValueEntity(unit: 'un', value: 1.1),
    proteins: UnitValueEntity(unit: 'un', value: 1.1),
    lipids: UnitValueEntity(unit: 'un', value: 1.1),
    carbohydrates: UnitValueEntity(unit: 'un', value: 1.1),
    fibers: UnitValueEntity(unit: 'un', value: 1.1),
  ),
);

List<ProductEntity> fakeProducts = [
  ProductEntity(
      id: "4e7b60cc-f706-48d0-816e-4a58d8a84ae9",
      name: 'Laranja',
      description: 'descrição da laranja',
      image:
          'https://firebasestorage.googleapis.com/v0/b/idheaconsultv2.appspot.com/o/mock%2Flaranja_pera.png?alt=media&token=8ea068a9-7324-42c4-9b8a-782e0d27deaf',
      price: 1.0,
      unit: 'kg',
      stock: 100,
      nutritionalTable: NutritionalTableEntity(
        moisture: UnitValueEntity(unit: 'un', value: 1.1),
        energy: UnitValueEntity(unit: 'un', value: 1.1),
        proteins: UnitValueEntity(unit: 'un', value: 1.1),
        lipids: UnitValueEntity(unit: 'un', value: 1.1),
        carbohydrates: UnitValueEntity(unit: 'un', value: 1.1),
        fibers: UnitValueEntity(unit: 'un', value: 1.1),
      )),
  ProductEntity(
    id: "c6961578-ea13-4665-870a-f25f49854ef4",
    name: 'Banana',
    description: 'descrição da Banana',
    image:
        'https://firebasestorage.googleapis.com/v0/b/idheaconsultv2.appspot.com/o/mock%2Flaranja_pera.png?alt=media&token=8ea068a9-7324-42c4-9b8a-782e0d27deaf',
    price: 1.0,
    unit: 'kg',
    stock: 100,
    nutritionalTable: NutritionalTableEntity(
      moisture: UnitValueEntity(unit: 'un', value: 1.1),
      energy: UnitValueEntity(unit: 'un', value: 1.1),
      proteins: UnitValueEntity(unit: 'un', value: 1.1),
      lipids: UnitValueEntity(unit: 'un', value: 1.1),
      carbohydrates: UnitValueEntity(unit: 'un', value: 1.1),
      fibers: UnitValueEntity(unit: 'un', value: 1.1),
    ),
  ),
];

ResponseList<ProductEntity> responseProductList = ResponseList<ProductEntity>(
  pageInfo: PageInfoResponse(totalPages: 2, totalRows: 11),
  data: fakeProducts,
);
