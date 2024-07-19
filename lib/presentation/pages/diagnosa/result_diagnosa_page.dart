import 'package:flutter/material.dart';
import 'package:healtheats/config/routes/app_routes.dart';
import 'package:healtheats/core/utils/constants.dart';
import 'package:healtheats/presentation/providers/deteksi_provider.dart';
import 'package:healtheats/presentation/widgets/box/recommend_food_box.dart';
import 'package:provider/provider.dart';

class ResultDiagnosaPage extends StatefulWidget {
  const ResultDiagnosaPage({super.key});

  @override
  State<ResultDiagnosaPage> createState() => _ResultDiagnosaPageState();
}

class _ResultDiagnosaPageState extends State<ResultDiagnosaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/');
          },
        ),
        title: Text(
          'Result Diagnosa',
          style: AppTextStyles.poppins_16_semibold_white,
        ),
        centerTitle: true,
      ),
      backgroundColor: AppColors.primaryColor,
      body: SizedBox(
        height: AppScreenSize.height,
        width: AppScreenSize.width,
        child: Consumer<DeteksiProvider>(
          builder: (context, value, child) {
            final result = value.recommend;
            if (result == null) {
              return Center(
                child: Text(
                  'No result available',
                  style: AppTextStyles.poppins_16_semibold_white,
                ),
              );
            }

            final foods = result.recommendations;
            return Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 20,
                  ),
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'PENYAKIT',
                            style: AppTextStyles.poppins_12_semibold_white,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Text(
                            result.penyakit,
                            style: AppTextStyles.poppins_16_bold_white,
                          ),
                        ],
                      ),
                      Image.asset(
                        'assets/images/white_heart.png',
                        width: 40,
                        height: 40,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'PERSENTASE',
                            style: AppTextStyles.poppins_12_semibold_white,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Text(
                            result.persentase,
                            style: AppTextStyles.poppins_16_bold_white,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    height: AppScreenSize.height,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 20,
                    ),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                      color: Colors.white,
                    ),
                    child: Stack(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Deskripsi',
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              result.description,
                              style: Theme.of(context).textTheme.labelLarge,
                              textAlign: TextAlign.justify,
                            ),
                          ],
                        ),
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Recommendation Food',
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                width: AppScreenSize.width,
                                height: 180,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: foods.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: EdgeInsets.only(
                                        right:
                                            index == foods.length - 1 ? 20 : 0,
                                        bottom: 15,
                                        left: 10,
                                      ),
                                      child: GestureDetector(
                                        onTap: () {
                                          Navigator.pushNamed(
                                            context,
                                            AppRoutes.detailFood,
                                            arguments: {
                                              'id': foods[index].idFood
                                            },
                                          );
                                        },
                                        child: RecommendFoodBox(
                                          image: foods[index].image,
                                          name: foods[index].foodName,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
