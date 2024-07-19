import 'dart:convert';

import 'package:healtheats/data/datasources/api/api_config.dart';
import 'package:healtheats/data/models/food_model.dart';
import 'package:healtheats/domain/repository/favorite_food_repository.dart';
import 'package:healtheats/domain/usecases/auth_usecase.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class FavoriteFoodRepositoryImpl implements FavoriteFoodRepository {
  final AuthUsecase authUsecase;

  FavoriteFoodRepositoryImpl({required this.authUsecase});

  @override
  Future<http.Response> addFavorite(int id, bool isFavorite) async {
    await authUsecase.updateToken();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('accessToken');

    final response = await http.post(
      Uri.parse('${ApiConfig.addFavorite}/$id'),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({'isFavorite': isFavorite}),
    );

    return response;
  }

  @override
  Future<List<FoodModel>> getAllFavorite() async {
    await authUsecase.updateToken();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('accessToken');

    final response = await http.get(
      Uri.parse(ApiConfig.allFavorite),
      headers: {'Authorization': 'Bearer $token'},
    );

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final foods = (json['result'] as List).map((e) {
        var food = e['foods'];
        return FoodModel(
          idFood: food['id_food'] ?? '',
          name: food['food_name'] ?? '',
          deskripsi: food['deskripsi'] ?? '',
          image: food['image'] ?? '',
          ingredients: food['ingredients'] ?? '',
          khasiat: food['khasiat'] ?? '',
          steps: food['steps'] ?? '',
          type: food['type'] ?? '',
          isFavorite: e['isFavorite'] ?? false,
        );
      }).toList();
      return foods;
    }
    throw "Something went wrong while get all favorite foods!";
  }

  @override
  Future<http.Response> rmFavorite(int id) async {
    await authUsecase.updateToken();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('accessToken');

    return await http.delete(
      Uri.parse('${ApiConfig.rmFavorite}/id'),
      headers: {'Authorization': 'Bearer $token'},
    );
  }
}
