import 'package:flutter/material.dart';
import 'package:healtheats/core/utils/constants.dart';
import 'package:healtheats/data/models/food_model.dart';
import 'package:healtheats/presentation/providers/food_provider.dart';
import 'package:healtheats/presentation/widgets/button/circle_button.dart';
import 'package:provider/provider.dart';

class DetailFoodPage extends StatefulWidget {
  final int? id;
  const DetailFoodPage({
    super.key,
    required this.id,
  });

  @override
  State<DetailFoodPage> createState() => _DetailFoodPageState();
}

class _DetailFoodPageState extends State<DetailFoodPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<FoodProvider>(context, listen: false)
          .getDetailFood(widget.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<FoodProvider>(builder: (context, foodProvider, child) {
      FoodModel? food = foodProvider.food;

      if (food == null) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }

      List<String> ingredients = food.ingredients.split('. ');
      List<String> steps =
          food.steps.split('_').where((item) => item.isNotEmpty).toList();

      return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: AppScreenSize.width,
                height: AppScreenSize.height * 0.35,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(food.image),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      top: 40,
                      left: 20,
                      child: CircleButton(
                        icon: Icons.arrow_back_ios_new_outlined,
                        onTap: () {
                          Navigator.pop(context);
                        },
                        color: Colors.white,
                      ),
                    ),
                    Positioned(
                      top: 40,
                      right: 20,
                      child: CircleButton(
                        icon: food.isFavorite
                            ? Icons.favorite
                            : Icons.favorite_outline,
                        onTap: () {},
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      food.name,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      food.khasiat,
                      style: Theme.of(context).textTheme.labelLarge,
                      textAlign: TextAlign.justify,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Ingredients',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    if (ingredients.isNotEmpty)
                      ListView.builder(
                        shrinkWrap: true,
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: ingredients.length,
                        itemBuilder: (context, index) {
                          return Container(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${(index + 1).toString()}. ',
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Text(
                                    '${ingredients[index]}.',
                                    style:
                                        Theme.of(context).textTheme.labelLarge,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      )
                    else
                      Text(
                        'No ingredients available',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Steps',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    if (steps.isNotEmpty)
                      ListView.builder(
                        shrinkWrap: true,
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: steps.length,
                        itemBuilder: (context, index) {
                          return Container(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${(index + 1).toString()}. ',
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Text(
                                    steps[index],
                                    style:
                                        Theme.of(context).textTheme.labelLarge,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      )
                    else
                      Text(
                        'No steps available',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                  ],
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
