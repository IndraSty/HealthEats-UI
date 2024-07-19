import 'package:flutter/material.dart';
import 'package:healtheats/config/routes/app_routes.dart';
import 'package:healtheats/core/utils/constants.dart';
import 'package:healtheats/data/models/food_model.dart';
import 'package:healtheats/presentation/providers/favorite_food_provider.dart';
import 'package:healtheats/presentation/providers/food_provider.dart';
import 'package:healtheats/presentation/widgets/appbar/appbar_food.dart';
import 'package:healtheats/presentation/widgets/box/full_food_box.dart';
import 'package:healtheats/presentation/widgets/shimmer/full_box_shimmer.dart';
import 'package:provider/provider.dart';

class FoodPage extends StatefulWidget {
  const FoodPage({super.key});

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  bool onSearch = false;
  String searchText = '';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<FoodProvider>(context, listen: false).getAllFood();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarFood(
        onSearch: onSearch,
        onSearchClicked: () {
          setState(() {
            onSearch = true;
          });
        },
        onBackClicked: () {
          setState(() {
            onSearch = false;
          });
        },
        onChange: (value) {
          setState(() {
            searchText = value;
          });
        },
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: AppColors.greyBg,
        ),
        child: Consumer<FoodProvider>(
          builder: (context, value, child) {
            final List<FoodModel>? foods = value.allFood;
            final List<FoodModel> filteredFoods = foods
                    ?.where((food) => food.name
                        .toLowerCase()
                        .contains(searchText.toLowerCase()))
                    .toList() ??
                [];
            var favorite = Provider.of<FavoriteFoodProvider>(context);

            if (value.isLoading) {
              return ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return const FullBoxShimmer();
                },
              );
            } else if (foods == null) {
              return const Center(child: Text('No Food data available'));
            } else {
              return Container(
                padding: const EdgeInsets.only(
                  top: 10,
                  bottom: 0,
                  left: 20,
                  right: 20,
                ),
                child: ListView.builder(
                  itemCount: filteredFoods.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: GestureDetector(
                        onTap: () {
                          print(
                              "tipenya: ${filteredFoods[index].idFood.runtimeType}");
                          Navigator.pushNamed(context, AppRoutes.detailFood,
                              arguments: {'id': filteredFoods[index].idFood});
                        },
                        child: FullFoodBox(
                          foods: filteredFoods,
                          desc: filteredFoods[index].deskripsi,
                          name: filteredFoods[index].name,
                          image: filteredFoods[index].image,
                          isFavorite:
                              favorite.isFavorite(filteredFoods[index].idFood),
                          favoriteCLicked: () {
                            favorite
                                .toggleFavorite(filteredFoods[index].idFood);
                          },
                        ),
                      ),
                    );
                  },
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
