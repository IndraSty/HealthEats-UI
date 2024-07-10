abstract class AuthRepository {
  Future<void> register(String email, name, password);
  Future<void> login(String email, password);
  Future<void> updateToken();
  Future<bool> isAuthenticated();
}
