import 'package:flutter/material.dart';
import 'package:healtheats/data/models/food_model.dart';
import 'package:healtheats/domain/usecases/favorite_food_usecase.dart';
import 'package:http/http.dart' as http;

class FavoriteFoodProvider with ChangeNotifier {
  final FavoriteFoodUsecase favoriteFoodUsecase;

  final Map<int, bool> _favoriteMap = {};
  bool isFavorite(int id) => _favoriteMap[id] ?? false;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _message;
  String? get message => _message;

  List<FoodModel>? _favoriteFoods;
  List<FoodModel>? get favoriteFoods => _favoriteFoods;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  FavoriteFoodProvider({required this.favoriteFoodUsecase});

  void toggleFavorite(int id) async {
    bool oldStatus = isFavorite(id);
    _favoriteMap[id] = !oldStatus;
    notifyListeners();

    try {
      _isLoading = true;
      notifyListeners();

      http.Response response;
      if (_favoriteMap[id] ?? false) {
        response = await favoriteFoodUsecase.addFavorite(id, _favoriteMap[id]!);
      } else {
        response = await favoriteFoodUsecase.rmFavorite(id);
      }

      if (response.statusCode != 200) {
        _favoriteMap[id] = oldStatus;
        _errorMessage = "Failed to update favorite status";
      } else {
        _message = "Favorite status updated successfully";
      }
    } catch (e) {
      _favoriteMap[id] = oldStatus;
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> getAllFavorite() async {
    _isLoading = true;
    notifyListeners();

    try {
      final response = await favoriteFoodUsecase.getAllFavorite();
      _favoriteFoods = response;
      _errorMessage = null;
      notifyListeners();
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
