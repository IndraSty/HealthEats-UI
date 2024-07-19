import 'package:flutter/material.dart';
import 'package:healtheats/config/routes/app_routes.dart';
import 'package:healtheats/config/themes/theme.dart';
import 'package:healtheats/data/repository/auth_repository.dart';
import 'package:healtheats/data/repository/favorite_food_repository.dart';
import 'package:healtheats/data/repository/food_repository.dart';
import 'package:healtheats/data/repository/user_repository.dart';
import 'package:healtheats/domain/usecases/auth_usecase.dart';
import 'package:healtheats/domain/usecases/favorite_food_usecase.dart';
import 'package:healtheats/domain/usecases/food_usecase.dart';
import 'package:healtheats/domain/usecases/user_usecase.dart';
import 'package:healtheats/presentation/pages/wrapper/auth_wrapper.dart';
import 'package:healtheats/presentation/providers/auth_provider.dart';
import 'package:healtheats/presentation/providers/favorite_food_provider.dart';
import 'package:healtheats/presentation/providers/food_provider.dart';
import 'package:healtheats/presentation/providers/user_provider.dart';
import 'package:provider/provider.dart';

final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
    GlobalKey<ScaffoldMessengerState>();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authRepository = AuthRepositoryImpl();
    final authUsecase = AuthUsecase(authRepository: authRepository);
    final userRepository = UserRepositoryImpl(authUsecase: authUsecase);
    final userUsecase = UserUsecase(userRepository: userRepository);
    final foodRepository = FoodRepositoryImpl(authUsecase: authUsecase);
    final foodUsecase = FoodUsecase(foodRepository: foodRepository);
    final favoriteFoodRepository =
        FavoriteFoodRepositoryImpl(authUsecase: authUsecase);
    final favoriteFoodUsecase =
        FavoriteFoodUsecase(favoriteFoodRepository: favoriteFoodRepository);

    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthProvider>(
          create: (_) => AuthProvider(authUsecase: authUsecase),
        ),
        ChangeNotifierProvider<UserProvider>(
          create: (_) => UserProvider(userUsecase: userUsecase),
        ),
        ChangeNotifierProvider(
          create: (_) => FoodProvider(foodUsecase: foodUsecase),
        ),
        ChangeNotifierProvider(
          create: (_) =>
              FavoriteFoodProvider(favoriteFoodUsecase: favoriteFoodUsecase),
        ),
      ],
      child: MaterialApp(
        scaffoldMessengerKey: scaffoldMessengerKey,
        title: 'HealthEats',
        themeMode: ThemeMode.system,
        theme: HEAppTheme.ligtTheme,
        darkTheme: HEAppTheme.darkTheme,
        onGenerateRoute: AppRoutes.generateRoute,
        home: const AuthWrapper(),
      ),
    );
  }
}
