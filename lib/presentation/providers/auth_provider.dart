import 'package:flutter/material.dart';
import 'package:healtheats/core/utils/constants.dart';
import 'package:healtheats/domain/usecases/auth_usecase.dart';
import 'package:healtheats/main.dart';

class AuthProvider with ChangeNotifier {
  final AuthUsecase authUsecase;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _isAuth = false;
  bool get isAuth => _isAuth;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  AuthProvider({required this.authUsecase});

  Future<void> register(String email, String name, String password) async {
    _isLoading = true;
    notifyListeners();

    try {
      await authUsecase.register(email, name, password);
      _errorMessage = null;
      scaffoldMessengerKey.currentState?.showSnackBar(
        const SnackBar(
          content: Text("Daftar Berhasil, Silahkan login"),
          backgroundColor: AppColors.primaryColor,
        ),
      );
    } catch (e) {
      _errorMessage = e.toString();
      scaffoldMessengerKey.currentState?.showSnackBar(
        SnackBar(
          content: Text(_errorMessage!),
          backgroundColor: AppColors.dangerColor,
        ),
      );
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> login(String email, String password) async {
    _isLoading = true;
    notifyListeners();

    try {
      await authUsecase.login(email, password);
      _isAuth = true;
      _errorMessage = null;
    } catch (e) {
      _errorMessage = e.toString();
      scaffoldMessengerKey.currentState?.showSnackBar(
        SnackBar(
          content: Text(_errorMessage!),
          backgroundColor: AppColors.dangerColor,
        ),
      );
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> _checkAuthStatus() async {
    _isAuth = await authUsecase.isAuthenticated();
    notifyListeners();
  }
}
