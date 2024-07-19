import 'package:flutter/material.dart';
import 'package:healtheats/core/utils/constants.dart';

class QuestionChoiceBox extends StatelessWidget {
  const QuestionChoiceBox({
    super.key,
    required this.onSelect,
    required this.question,
  });

  final bool onSelect;
  final String question;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.primaryColor,
        ),
        borderRadius: BorderRadius.circular(30),
      ),
      child: onSelect
          ? Row(
              children: [
                Container(
                  height: double.infinity,
                  width: 15,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      bottomLeft: Radius.circular(50),
                    ),
                    color: AppColors.primaryColor,
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      question,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                ),
              ],
            )
          : Center(
              child: Text(
                question,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
    );
  }
}
