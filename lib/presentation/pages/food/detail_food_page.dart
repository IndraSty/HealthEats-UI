import 'package:flutter/material.dart';
import 'package:healtheats/core/utils/constants.dart';
import 'package:healtheats/presentation/widgets/circle_button.dart';

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
      // Provider.of<FoodProvider>(context, listen: false)
      //     .getDetailFood(widget.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    var foods = Foods.allFood;
    var food = Foods.allFood[0];
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
                      icon: Icons.favorite_outline,
                      onTap: () {},
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    food.name,
                    style: AppTextStyles.poppins_18_bold,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "food.khasiat",
                    style: AppTextStyles.poppins_12_reguler,
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Ingredients',
                    style: AppTextStyles.poppins_12_reguler,
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: foods.length,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${(index + 1).toString()}. ',
                              style: AppTextStyles.poppins_14_reguler,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Text(
                                '.',
                                style: AppTextStyles.poppins_12_reguler,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Steps',
                    style: AppTextStyles.poppins_18_bold,
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: foods.length,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${(index + 1).toString()}. ',
                              style: AppTextStyles.poppins_14_reguler,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Text(
                                "steps[index]",
                                style: AppTextStyles.poppins_12_reguler,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
