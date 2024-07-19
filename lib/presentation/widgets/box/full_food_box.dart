import 'package:flutter/material.dart';
import 'package:healtheats/core/utils/constants.dart';
import 'package:healtheats/data/models/food_model.dart';

class FullFoodBox extends StatelessWidget {
  const FullFoodBox({
    super.key,
    required this.foods,
    required this.name,
    required this.desc,
    required this.image,
    required this.isFavorite,
    required this.favoriteCLicked,
  });

  final List<FoodModel> foods;
  final String name;
  final String desc;
  final String image;
  final bool isFavorite;
  final void Function() favoriteCLicked;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(7),
      width: AppScreenSize.width,
      height: 105,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(children: [
        Container(
          height: double.infinity,
          width: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: NetworkImage(image),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 5,
              ),
              Text(
                name,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                desc,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.labelLarge,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                'Sehat - Stroke',
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.poppins_12_reguler_gray,
              )
            ],
          ),
        ),
        Padding(
            padding: const EdgeInsets.only(left: 20),
            child: IconButton(
              onPressed: favoriteCLicked,
              icon: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                color: isFavorite ? AppColors.primaryColor : AppColors.textGray,
                size: 24,
              ),
            ))
      ]),
    );
  }
}
