import 'package:flutter/material.dart';
import 'package:healtheats/data/models/food_model.dart';
import 'package:healtheats/domain/usecases/food_usecase.dart';

class FoodProvider with ChangeNotifier {
  final FoodUsecase foodUsecase;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  List<FoodModel>? _foodMWC;
  List<FoodModel> get foodMWC => _foodMWC!;

  List<FoodModel>? _foodMD;
  List<FoodModel> get foodMD => _foodMD!;

  List<FoodModel>? _allFood;
  List<FoodModel> get allFood => _allFood!;

  FoodModel? _food;
  FoodModel get food => _food!;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  FoodProvider({required this.foodUsecase});

  Future<void> getFoodForMWC() async {
    _isLoading = true;
    notifyListeners();

    try {
      final response = await foodUsecase.getRandomFood();
      _foodMWC = response;
      _errorMessage = null;
      notifyListeners();
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> getFoodForMD() async {
    _isLoading = true;
    notifyListeners();

    try {
      final response = await foodUsecase.getRandomFood();
      _foodMD = response;
      _errorMessage = null;
      notifyListeners();
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> getDetailFood(int id) async {
    _isLoading = true;
    notifyListeners();

    try {
      final response = await foodUsecase.getDetailFood(id);
      _food = response;
      _errorMessage = null;
      notifyListeners();
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> getAllFood() async {
    _isLoading = true;
    notifyListeners();

    try {
      final response = await foodUsecase.getAllFood();
      _allFood = response;
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
