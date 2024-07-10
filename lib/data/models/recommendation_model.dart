import 'package:healtheats/domain/entities/recommendation_entity.dart';

class RecommendationModel extends RecommendationEntity {
  RecommendationModel(
      {required super.idFood,
      required super.foodName,
      required super.ingredients,
      required super.steps,
      required super.image,
      required super.khasiat,
      required super.deskripsi});

  factory RecommendationModel.fromJson(Map<String, dynamic> json) {
    return RecommendationModel(
      idFood: json['id_food'] ?? 0,
      foodName: json['food_name'] ?? '',
      ingredients: json['ingredients'] ?? '',
      steps: json['steps'] ?? '',
      image: json['image'] ?? '',
      khasiat: json['khasiat'] ?? '',
      deskripsi: json['deskripsi'] ?? '',
    );
  }

  factory RecommendationModel.fromEntity(RecommendationEntity entity) {
    return RecommendationModel(
        idFood: entity.idFood,
        foodName: entity.foodName,
        ingredients: entity.ingredients,
        steps: entity.steps,
        image: entity.image,
        khasiat: entity.khasiat,
        deskripsi: entity.deskripsi);
  }
}
