import 'package:healtheats/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    required int idUser,
    required String email,
    required String name,
    required String image,
  }) : super(
          email: email,
          idUser: idUser,
          image: image,
          name: name,
        );

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      idUser: json['id_user'],
      email: json['email'],
      name: json['name'],
      image: json['image'],
    );
  }

  UserModel.castFromEntity(final UserEntity user)
      : super(
            idUser: user.idUser,
            email: user.email,
            name: user.name,
            image: user.image);
}
