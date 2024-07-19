import 'package:flutter/material.dart';
import 'package:healtheats/data/models/food_model.dart';
import 'package:healtheats/presentation/providers/favorite_food_provider.dart';
import 'package:healtheats/presentation/widgets/box/full_food_box.dart';
import 'package:healtheats/presentation/widgets/shimmer/full_box_shimmer.dart';
import 'package:provider/provider.dart';

class FavoriteView extends StatefulWidget {
  const FavoriteView({super.key});

  @override
  State<FavoriteView> createState() => _FavoriteViewState();
}

class _FavoriteViewState extends State<FavoriteView> {
  @override
  Widget build(BuildContext context) {
    return Consumer<FavoriteFoodProvider>(builder: (context, value, child) {
      List<FoodModel>? food = value.favoriteFoods;
      var favorite = Provider.of<FavoriteFoodProvider>(context);

      if (value.isLoading) {
        return ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            return const Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: FullBoxShimmer(),
            );
          },
        );
      } else if (food == null || food.isEmpty) {
        return const Center(
          child: Text("You don't have a favorite food yet"),
        );
      } else {
        // Display actual data
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: ListView.builder(
            itemCount: food.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: FullFoodBox(
                  desc: food[index].deskripsi,
                  name: food[index].name,
                  image: food[index].image,
                  foods: food,
                  isFavorite: favorite.isFavorite(food[index].idFood),
                  favoriteCLicked: () {
                    favorite.toggleFavorite(food[index].idFood);
                  },
                ),
              );
            },
          ),
        );
      }
    });
  }
}
