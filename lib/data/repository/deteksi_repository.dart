import 'dart:convert';

import 'package:healtheats/data/datasources/api/api_config.dart';
import 'package:healtheats/data/models/deteksi_model.dart';
import 'package:healtheats/domain/repository/deteksi_repository.dart';
import 'package:healtheats/domain/usecases/auth_usecase.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:http/http.dart' as http;

class DeteksiRepositoryImpl implements DeteksiRepository {
  final AuthUsecase authUsecase;

  DeteksiRepositoryImpl({required this.authUsecase});
  @override
  Future<DeteksiModel> get(List answer) async {
    await authUsecase.updateToken();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('accessToken');

    final response = await http.post(
      Uri.parse(ApiConfig.prediction),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode({'input_data': answer}),
    );

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return DeteksiModel.fromJson(json['result']);
    } else {
      throw Exception('Failed to load recommendations');
    }
  }
}
