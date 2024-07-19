import 'package:flutter/material.dart';
import 'package:healtheats/presentation/pages/daftar/daftar_page.dart';
import 'package:healtheats/presentation/pages/diagnosa/result_diagnosa_page.dart';
import 'package:healtheats/presentation/pages/food/detail_food_page.dart';
import 'package:healtheats/presentation/pages/login/login_page.dart';
import 'package:healtheats/presentation/pages/navbar/bottom_nav_page.dart';
import 'package:healtheats/presentation/pages/profile/my_account_page.dart';

class AppRoutes {
  static const String home = '/';
  static const String login = '/login';
  static const String daftar = '/daftar';
  static const String profile = '/profile';
  static const String food = '/food';
  static const String detailFood = '/detail-food/:id';
  static const String history = '/history';
  static const String myAcc = '/my-account';
  static const String result = '/result-diagnos';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments as Map<String, dynamic>?;
    switch (settings.name) {
      case home:
        return MaterialPageRoute(
            builder: (_) => const BottomNavPage(
                  selectedIndex: 0,
                ));
      case login:
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case daftar:
        return MaterialPageRoute(builder: (_) => const DaftarPage());
      case myAcc:
        return MaterialPageRoute(builder: (_) => const MyAccountPage());
      case result:
        return MaterialPageRoute(builder: (_) => const ResultDiagnosaPage());
      case food:
        return MaterialPageRoute(
            builder: (_) => const BottomNavPage(
                  selectedIndex: 1,
                ));
      case AppRoutes.detailFood:
        final id = args?['id'] as int?;
        return MaterialPageRoute(
          builder: (_) => DetailFoodPage(id: id),
        );
      case profile:
        return MaterialPageRoute(
            builder: (_) => const BottomNavPage(
                  selectedIndex: 3,
                ));
      case history:
        return MaterialPageRoute(
            builder: (_) => const BottomNavPage(
                  selectedIndex: 2,
                ));
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
