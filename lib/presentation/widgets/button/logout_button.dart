import 'package:flutter/material.dart';
import 'package:healtheats/core/utils/constants.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          width: 1.5,
          color: Colors.redAccent,
        ),
        color: Colors.white,
      ),
      child: Row(
        children: [
          const Icon(
            Icons.logout_rounded,
            color: Colors.redAccent,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            'Logout',
            style: AppTextStyles.poppins_12_medium_danger,
          ),
        ],
      ),
    );
  }
}
