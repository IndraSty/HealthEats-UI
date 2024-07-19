import 'package:healtheats/data/models/food_model.dart';
import 'package:http/http.dart' as http;

abstract class FavoriteFoodRepository {
  Future<http.Response> addFavorite(int id, bool isFavorite);
  Future<http.Response> rmFavorite(int id);
  Future<List<FoodModel>> getAllFavorite();
}
