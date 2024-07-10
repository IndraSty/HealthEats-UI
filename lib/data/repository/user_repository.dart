import 'dart:convert';

import 'package:healtheats/data/datasources/api/api_config.dart';
import 'package:healtheats/data/models/user_model.dart';
import 'package:healtheats/domain/entities/user_entity.dart';
import 'package:healtheats/domain/repository/user_repository.dart';
import 'package:healtheats/domain/usecases/auth_usecase.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class UserRepositoryImpl implements UserRepository {
  final AuthUsecase authUsecase;

  UserRepositoryImpl({required this.authUsecase});

  @override
  Future<UserModel> get() async {
    await authUsecase.updateToken();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('accessToken');

    final response = await http.get(
      Uri.parse(ApiConfig.user),
      headers: {'Authorization': 'Bearer $token'},
    );

    print(response.statusCode);

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return UserModel(
        name: json['data']['name'] ?? '',
        email: json['data']['email'] ?? '',
        idUser: json['data']['id_user'] ?? '',
        image: json['data']['image'] ?? '',
      );
    } else {
      throw Exception("Failed to load user data");
    }
  }

  @override
  Future<void> update(UserEntity user) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
