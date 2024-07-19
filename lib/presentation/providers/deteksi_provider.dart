import 'package:flutter/material.dart';
import 'package:healtheats/data/models/deteksi_model.dart';
import 'package:healtheats/domain/usecases/deteksi_usecase.dart';

class DeteksiProvider with ChangeNotifier {
  final DeteksiUsecase deteksiUsecase;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _message;
  String? get message => _message;

  DeteksiModel? _recommend;
  DeteksiModel? get recommend => _recommend;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  DeteksiProvider({required this.deteksiUsecase});

  Future<void> fetchPredictionAndRecommend(List answer) async {
    _isLoading = true;
    notifyListeners();

    try {
      final response = await deteksiUsecase.get(answer);
      _recommend = response;
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
