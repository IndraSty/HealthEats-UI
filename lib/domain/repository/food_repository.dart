import 'package:healtheats/data/models/food_model.dart';

abstract class FoodRepository {
  Future<List<FoodModel>> getRandomFood();
  Future<List<FoodModel>> getAllFood();
  Future<FoodModel> getDetailFood(int id);
}
