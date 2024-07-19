import 'package:flutter/material.dart';
import 'package:healtheats/config/routes/app_routes.dart';
import 'package:healtheats/core/utils/constants.dart';
import 'package:healtheats/data/models/food_model.dart';
import 'package:healtheats/presentation/providers/favorite_food_provider.dart';
import 'package:healtheats/presentation/widgets/box/food_box.dart';
import 'package:healtheats/presentation/widgets/shimmer/box_shimmer.dart';
import 'package:provider/provider.dart';

class HomeItemCategory extends StatelessWidget {
  const HomeItemCategory({
    super.key,
    required this.title,
    required this.foods,
    required this.isLoading,
  });

  final String title;
  final List<FoodModel>? foods;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    final foodList = foods ?? []; // Use an empty list if foods is null

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: AppTextStyles.poppins_16_semibold,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, AppRoutes.food);
                },
                child: Text(
                  'Lihat Semua',
                  style: AppTextStyles.poppins_12_medium_primary,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          width: AppScreenSize.width,
          height: 230,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: isLoading ? 5 : foodList.length,
            itemBuilder: (context, index) {
              var favorite = Provider.of<FavoriteFoodProvider>(context);
              if (isLoading) {
                return const Padding(
                  padding: EdgeInsets.only(
                    right: 20,
                    bottom: 15,
                    left: 20,
                  ),
                  child: BoxShimmer(),
                );
              } else {
                return Padding(
                  padding: EdgeInsets.only(
                    right: index == foodList.length - 1 ? 20 : 0,
                    bottom: 15,
                    left: 20,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, AppRoutes.detailFood,
                          arguments: {'id': foodList[index].idFood});
                    },
                    child: FoodBox(
                      image: foodList[index].image,
                      name: foodList[index].name,
                      favoriteCLicked: () {
                        favorite.toggleFavorite(foodList[index].idFood);
                      },
                      onFavorite: favorite.isFavorite(foodList[index].idFood),
                    ),
                  ),
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
