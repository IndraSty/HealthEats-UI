import 'package:flutter/material.dart';
import 'package:healtheats/core/utils/constants.dart';
import 'package:healtheats/presentation/providers/food_provider.dart';
import 'package:healtheats/presentation/providers/user_provider.dart';
import 'package:healtheats/presentation/widgets/appbar_home.dart';
import 'package:healtheats/presentation/widgets/check_disease_box.dart';
import 'package:healtheats/presentation/widgets/home_item_category.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var foods = Foods.allFood;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<UserProvider>(context, listen: false).get();
      Provider.of<FoodProvider>(context, listen: false).getFoodForMWC();
      Provider.of<FoodProvider>(context, listen: false).getFoodForMD();
    });
  }

  @override
  Widget build(BuildContext context) {
    final foodMWC = Provider.of<FoodProvider>(context).foodMWC;
    final foodMD = Provider.of<FoodProvider>(context).foodMD;
    return Scaffold(
      appBar: const AppbarHome(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: CheckDiseaseBox(),
            ),
            const SizedBox(
              height: 20,
            ),
            HomeItemCategory(
              title: 'Menu Wajib Coba',
              foods: foods,
            ),
            const SizedBox(
              height: 10,
            ),
            HomeItemCategory(
              title: 'Mudah Dibuat',
              foods: foods,
            ),
          ],
        ),
      ),
    );
  }
}
