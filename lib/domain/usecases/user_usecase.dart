import 'package:healtheats/data/models/user_model.dart';
import 'package:healtheats/domain/repository/user_repository.dart';

class UserUsecase {
  final UserRepository userRepository;

  UserUsecase({required this.userRepository});

  Future<UserModel> get() async {
    try {
      return await userRepository.get();
    } catch (e) {
      rethrow;
    }
  }
}
