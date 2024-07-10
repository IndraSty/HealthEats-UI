import 'package:flutter/material.dart';
import 'package:healtheats/presentation/pages/login/login_page.dart';
import 'package:healtheats/presentation/pages/navbar/bottom_nav_page.dart';
import 'package:healtheats/presentation/providers/auth_provider.dart';
import 'package:provider/provider.dart';

class AuthWrapper extends StatefulWidget {
  const AuthWrapper({super.key});

  @override
  State<AuthWrapper> createState() => _AuthWrapperState();
}

class _AuthWrapperState extends State<AuthWrapper> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(builder: (context, authProvider, child) {
      return authProvider.isAuth
          ? const BottomNavPage(selectedIndex: 0)
          : const LoginPage();
    });
  }
}
