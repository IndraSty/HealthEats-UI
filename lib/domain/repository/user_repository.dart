import 'package:healtheats/data/models/user_model.dart';
import 'package:healtheats/domain/entities/user_entity.dart';

abstract class UserRepository {
  Future<void> update(UserEntity user);
  Future<UserModel> get();
}
