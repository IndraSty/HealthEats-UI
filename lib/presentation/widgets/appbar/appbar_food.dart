import 'package:flutter/material.dart';
import 'package:healtheats/core/utils/constants.dart';

class AppbarFood extends StatelessWidget implements PreferredSizeWidget {
  const AppbarFood({
    super.key,
    required this.onChange,
    required this.onSearchClicked,
    required this.onBackClicked,
    required this.onSearch,
  });

  final bool onSearch;
  final void Function() onSearchClicked;
  final void Function() onBackClicked;
  final void Function(String) onChange;

  @override
  Size get preferredSize => const Size.fromHeight(80);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 80,
      leading: Offstage(
        offstage: !onSearch,
        child: IconButton(
          onPressed: onBackClicked,
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.fontColor,
          ),
        ),
      ),
      title: onSearch
          ? Container(
              height: 45,
              width: AppScreenSize.width * 0.7,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.greyBg,
              ),
              child: Center(
                child: TextField(
                  onChanged: onChange,
                  style: AppTextStyles.poppins_12_semibold_gray,
                  keyboardType: TextInputType.name,
                  cursorColor: AppColors.textGray,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 12),
                    border: InputBorder.none,
                    prefixIcon: Icon(
                      Icons.search,
                      size: 24,
                      color: AppColors.fontColor,
                    ),
                  ),
                ),
              ),
            )
          : Text(
              'Foods',
              style: Theme.of(context).textTheme.titleLarge,
            ),
      centerTitle: true,
      actions: [
        Offstage(
          offstage: onSearch,
          child: IconButton(
              onPressed: onSearchClicked,
              icon: const Icon(
                Icons.search,
                color: AppColors.fontColor,
              )),
        ),
        const SizedBox(
          width: 20,
        )
      ],
    );
  }
}
