import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:healtheats/core/utils/constants.dart';

class FixedBottomText extends StatelessWidget {
  const FixedBottomText({
    super.key,
    required this.onTap,
    required this.text,
    required this.textButton,
  });

  final void Function() onTap;
  final String text;
  final String textButton;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          style: AppTextStyles.poppins_14_semibold_gray,
          children: [
            TextSpan(text: text),
            TextSpan(
              text: textButton,
              style: AppTextStyles.poppins_14_bold_primary,
              recognizer: TapGestureRecognizer()..onTap = onTap,
            ),
          ],
        ),
      ),
    );
  }
}
