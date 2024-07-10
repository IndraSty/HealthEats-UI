import 'dart:convert';

import 'package:healtheats/data/datasources/api/api_config.dart';
import 'package:http/http.dart' as http;
import 'package:healtheats/domain/repository/auth_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl();

  @override
  Future<void> login(String email, password) async {
    final response = await http.post(
      Uri.parse(ApiConfig.login),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      String refreshToken = response.headers['set-cookie']!;

      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('refreshToken', refreshToken);
    } else if (response.statusCode != 200) {
      var responseBody = jsonDecode(response.body);
      var errorMessage =
          responseBody['msg'] ?? responseBody['errors'] ?? "Failed to login";

      switch (errorMessage) {
        case "Wrong Password":
          errorMessage = "Password Anda Salah";
          break;
        case "Email Not Found":
          errorMessage = "Email belum terdaftar";
          break;
        default:
          errorMessage = "Gagal untuk login";
      }
      print(response.body);
      throw (errorMessage);
    }
  }

  @override
  Future<void> register(String email, name, password) async {
    final response = await http.post(
      Uri.parse(ApiConfig.register),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'name': name, 'password': password}),
    );
    if (response.statusCode != 201) {
      var responseBody = jsonDecode(response.body);
      var errorMessage = responseBody['message'] ?? 'Failed to register';
      if (errorMessage == "Email already exist") {
        errorMessage = "Email Sudah Terdaftar";
      }
      throw (errorMessage);
    }
  }

  @override
  Future<void> updateToken() async {
    int expire = 0;
    String token;
    final currentDate = DateTime.now().millisecondsSinceEpoch;

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String refreshToken = prefs.getString('refreshToken')!;

    if (expire * 1000 < currentDate) {
      final response = await http.get(
        Uri.parse(ApiConfig.token),
        headers: {'Cookie': refreshToken},
      );

      final data = jsonDecode(response.body);
      token = data['accessToken'];

      await prefs.setString('accessToken', token);
    } else {
      return;
    }
  }

  Future<bool> isAuthenticated() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('refreshToken') != null;
  }
}
