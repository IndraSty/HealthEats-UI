import 'package:healtheats/data/models/food_model.dart';
import 'package:healtheats/domain/repository/favorite_food_repository.dart';
import 'package:http/http.dart' as http;

class FavoriteFoodUsecase {
  final FavoriteFoodRepository favoriteFoodRepository;

  FavoriteFoodUsecase({required this.favoriteFoodRepository});

  Future<http.Response> addFavorite(int id, bool isFavorite) async {
    try {
      return await favoriteFoodRepository.addFavorite(id, isFavorite);
    } catch (e) {
      rethrow;
    }
  }

  Future<http.Response> rmFavorite(int id) async {
    try {
      return await favoriteFoodRepository.rmFavorite(id);
    } catch (e) {
      rethrow;
    }
  }

  Future<List<FoodModel>> getAllFavorite() async {
    try {
      return await favoriteFoodRepository.getAllFavorite();
    } catch (e) {
      rethrow;
    }
  }
}
