import 'package:healtheats/domain/entities/food_entity.dart';

class FoodModel extends FoodEntity {
  FoodModel(
      {required super.idFood,
      required super.name,
      required super.ingredients,
      required super.image,
      required super.steps,
      required super.khasiat,
      required super.type,
      required super.isFavorite,
      required super.deskripsi});

  factory FoodModel.fromJson(Map<String, dynamic> json) {
    return FoodModel(
      idFood: json['id_food'],
      name: json['food_name'],
      deskripsi: json['deskripsi'],
      image: json['image'],
      ingredients: json['ingredients'],
      khasiat: json['khasiat'],
      steps: json['steps'],
      isFavorite: json['isFavorite'],
      type: json['type'],
    );
  }

  factory FoodModel.castFromEntity(FoodEntity food) {
    return FoodModel(
        idFood: food.idFood,
        name: food.name,
        ingredients: food.ingredients,
        image: food.image,
        steps: food.steps,
        khasiat: food.khasiat,
        type: food.type,
        isFavorite: food.isFavorite,
        deskripsi: food.deskripsi);
  }
}
