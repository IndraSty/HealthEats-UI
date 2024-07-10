import 'package:flutter/material.dart';
import 'package:healtheats/core/utils/constants.dart';

class FoodBox extends StatelessWidget {
  const FoodBox({
    super.key,
    required this.image,
    required this.name,
    required this.onFavorite,
    required this.favoriteCLicked,
  });

  final String image;
  final String name;
  final void Function() favoriteCLicked;
  final bool onFavorite;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 1), // posisi shadow
          ),
        ],
      ),
      child: Flexible(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            height: 140,
            width: 170,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                image: DecorationImage(
                  image: NetworkImage(
                    image,
                  ),
                  fit: BoxFit.cover,
                )),
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: AppTextStyles.poppins_14_bold,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Sehat - Stroke",
                        style: AppTextStyles.poppins_12_reguler_gray,
                      ),
                      IconButton(
                        onPressed: favoriteCLicked,
                        icon: Icon(
                          onFavorite ? Icons.favorite : Icons.favorite_border,
                          color: onFavorite
                              ? AppColors.primaryColor
                              : AppColors.textMini,
                          size: 20,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
