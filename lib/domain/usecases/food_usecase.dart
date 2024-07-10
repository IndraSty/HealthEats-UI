import 'package:healtheats/data/models/food_model.dart';
import 'package:healtheats/domain/repository/food_repository.dart';

class FoodUsecase {
  final FoodRepository foodRepository;

  FoodUsecase({required this.foodRepository});

  Future<List<FoodModel>> getRandomFood() async {
    try {
      return await foodRepository.getRandomFood();
    } catch (e) {
      rethrow;
    }
  }

  Future<List<FoodModel>> getAllFood() async {
    try {
      return await foodRepository.getAllFood();
    } catch (e) {
      rethrow;
    }
  }

  Future<FoodModel> getDetailFood(int id) async {
    try {
      return await foodRepository.getDetailFood(id);
    } catch (e) {
      rethrow;
    }
  }
}
