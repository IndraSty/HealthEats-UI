import 'package:flutter/material.dart';
import 'package:healtheats/core/utils/constants.dart';
import 'package:healtheats/presentation/pages/food/food_page.dart';
import 'package:healtheats/presentation/pages/history/history_page.dart';
import 'package:healtheats/presentation/pages/home/home_page.dart';
import 'package:healtheats/presentation/pages/profile/profile_page.dart';

class BottomNavPage extends StatefulWidget {
  const BottomNavPage({super.key, required this.selectedIndex});
  final int selectedIndex;

  @override
  State<BottomNavPage> createState() => _BottomNavPageState();
}

class _BottomNavPageState extends State<BottomNavPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [
    HomePage(),
    FoodPage(),
    HistoryPage(),
    ProfilePage()
  ];

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.selectedIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        enableFeedback: false,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.white,
        selectedItemColor: AppColors.primaryColor,
        unselectedItemColor: AppColors.textGray,
        selectedIconTheme: const IconThemeData(
          color: AppColors.primaryColor,
          size: 26,
        ),
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home_outlined,
              ),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.restaurant_menu_outlined,
              ),
              label: 'Foods'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.history,
              ),
              label: 'History'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person_outline,
              ),
              label: 'Profile'),
        ],
      ),
    );
  }
}
