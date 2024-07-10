import 'package:flutter/material.dart';
import 'package:healtheats/data/models/user_model.dart';
import 'package:healtheats/domain/usecases/user_usecase.dart';

class UserProvider with ChangeNotifier {
  final UserUsecase userUsecase;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  UserModel? _user;
  UserModel? get user => _user;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  UserProvider({required this.userUsecase});

  Future<void> get() async {
    _isLoading = true;
    notifyListeners();
    try {
      final response = await userUsecase.get();
      _errorMessage = null;
      _user = response;
      notifyListeners();
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
