import 'package:healtheats/domain/repository/auth_repository.dart';

class AuthUsecase {
  final AuthRepository authRepository;

  AuthUsecase({required this.authRepository});

  Future<void> register(String email, String name, String password) async {
    try {
      await authRepository.register(email, name, password);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> login(String email, String password) async {
    try {
      return await authRepository.login(email, password);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updateToken() async {
    try {
      await authRepository.updateToken();
    } catch (e) {
      throw Exception('Failed to update token: $e');
    }
  }

  Future<bool> isAuthenticated() async {
    return await authRepository.isAuthenticated();
  }
}
