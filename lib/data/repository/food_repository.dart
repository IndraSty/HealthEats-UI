import 'dart:convert';

import 'package:healtheats/data/datasources/api/api_config.dart';
import 'package:healtheats/data/models/food_model.dart';
import 'package:healtheats/domain/repository/food_repository.dart';
import 'package:healtheats/domain/usecases/auth_usecase.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class FoodRepositoryImpl implements FoodRepository {
  final AuthUsecase authUsecase;

  FoodRepositoryImpl({required this.authUsecase});

  @override
  Future<List<FoodModel>> getAllFood() async {
    await authUsecase.updateToken();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('accessToken');

    final response = await http.get(
      Uri.parse(ApiConfig.allFood),
      headers: {'Authorization': 'Bearer $token'},
    );

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final foods = (json['result'] as List).map((e) {
        return FoodModel(
          idFood: e['id_food'] ?? '',
          name: e['food_name'] ?? '',
          deskripsi: e['deskripsi'] ?? '',
          image: e['image'] ?? '',
          ingredients: e['ingredients'] ?? '',
          khasiat: e['khasiat'] ?? '',
          steps: e['steps'] ?? '',
          type: e['type'] ?? '',
          isFavorite:
              e['favorite'].isNotEmpty ? e['favorite'][0]['isFavorite'] : false,
        );
      }).toList();
      return foods;
    }
    throw "Something went wrong!";
  }

  @override
  Future<FoodModel> getDetailFood(int id) async {
    await authUsecase.updateToken();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('accessToken');

    final response = await http.get(
      Uri.parse('${ApiConfig.detailFood}$id'),
      headers: {'Authorization': 'Bearer $token'},
    );

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return FoodModel(
        idFood: json['result']['id_food'],
        name: json['result']['food_name'],
        deskripsi: json['result']['deskripsi'],
        image: json['result']['image'],
        ingredients: json['result']['ingredients'],
        khasiat: json['result']['khasiat'],
        steps: json['result']['steps'],
        type: json['result']['type'],
        isFavorite: json['result']['favorite'].isNotEmpty
            ? json['result']['favorite'][0]['isFavorite']
            : false,
      );
    } else {
      throw "Failed to load user";
    }
  }

  @override
  Future<List<FoodModel>> getRandomFood() async {
    await authUsecase.updateToken();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('accessToken');

    final response = await http.get(
      Uri.parse(ApiConfig.randomFood),
      headers: {'Authorization': 'Bearer $token'},
    );

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final foods = (json['result'] as List).map((e) {
        return FoodModel(
          idFood: e['id_food'] ?? '',
          name: e['food_name'] ?? '',
          deskripsi: e['deskripsi'] ?? '',
          image: e['image'] ?? '',
          ingredients: e['ingredients'] ?? '',
          khasiat: e['khasiat'] ?? '',
          steps: e['steps'] ?? '',
          type: e['type'] ?? '',
          isFavorite:
              e['favorite'].isNotEmpty ? e['favorite'][0]['isFavorite'] : false,
        );
      }).toList();
      return foods;
    }
    throw "Something went wrong!";
  }
}
