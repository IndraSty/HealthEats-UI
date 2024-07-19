import 'package:flutter/material.dart';
import 'package:healtheats/core/utils/constants.dart';
import 'package:healtheats/presentation/widgets/box/history_recommen_box.dart';

class RecommendationsView extends StatelessWidget {
  RecommendationsView({super.key});
  final List<Foods> foods = Foods.allFood;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: const Column(
          children: [
            HistoryRecommenBox(
              date: '2 Juni 2023',
              disease: 'Stroke',
            ),
          ],
        ));
  }
}
