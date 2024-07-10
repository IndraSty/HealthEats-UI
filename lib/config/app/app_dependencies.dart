import 'package:flutter/material.dart';
import 'package:healtheats/data/repository/auth_repository.dart';
import 'package:healtheats/domain/usecases/auth_usecase.dart';
import 'package:healtheats/presentation/providers/auth_provider.dart';
import 'package:provider/provider.dart';

class AppDependencies {
  static void init(BuildContext context) {
    final authRepository = AuthRepositoryImpl();
    final authUsecase = AuthUsecase(authRepository: authRepository);

    MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (context) => AuthProvider(authUsecase: authUsecase))
      ],
    );
  }
}
