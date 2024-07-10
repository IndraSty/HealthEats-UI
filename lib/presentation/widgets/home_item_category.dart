import 'package:flutter/material.dart';
import 'package:healtheats/config/routes/app_routes.dart';
import 'package:healtheats/core/utils/constants.dart';
import 'package:healtheats/presentation/pages/food/detail_food_page.dart';
import 'package:healtheats/presentation/widgets/food_box.dart';

class HomeItemCategory extends StatelessWidget {
  const HomeItemCategory({
    super.key,
    required this.title,
    required this.foods,
  });

  final String title;
  final List<FoodData> foods;

  final bool onFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppColors.fontColor,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const BottomNavbar(selectedIndex: 1)));
                },
                child: Text(
                  'Lihat Semua',
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: AppColors.primaryColor,
                  ),
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
            itemCount: foods.length,
            itemBuilder: (context, index) {
              var favorite = Provider.of<FavoriteProvider>(context);
              return Padding(
                padding: EdgeInsets.only(
                  right: index == foods.length - 1 ? 20 : 0,
                  bottom: 15,
                  left: 20,
                ),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              DetailFoodPage(id: foods[index].idFood)),
                    );
                  },
                  child: FoodBox(
                    image: foods[index].image,
                    name: foods[index].name,
                    favoriteCLicked: () {
                      favorite.toggleFavorite(foods[index].idFood);
                    },
                    onFavorite: favorite.isFavorite(foods[index].idFood),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
