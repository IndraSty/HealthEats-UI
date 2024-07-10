import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healtheats/core/utils/constants.dart';
import 'package:healtheats/presentation/providers/user_provider.dart';
import 'package:provider/provider.dart';

class AppbarHome extends StatelessWidget implements PreferredSizeWidget {
  const AppbarHome({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(90);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    return AppBar(
      automaticallyImplyLeading: false,
      toolbarHeight: 90,
      backgroundColor: AppColors.primaryColor,
      title: Transform.translate(
        offset: const Offset(0, 0),
        child: Row(
          children: [
            Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    width: 1.5,
                    color: Colors.white,
                  )),
              padding: const EdgeInsets.all(2),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: user?.image != ''
                      ? DecorationImage(
                          image: NetworkImage(user!.image),
                          fit: BoxFit.cover,
                        )
                      : const DecorationImage(
                          image: AssetImage('assets/images/def_avatar_2.png'),
                          fit: BoxFit.cover,
                        ),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hallo',
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  user!.name,
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      actions: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            color: AppColors.miniBox,
          ),
          child: const Center(
            child: Icon(
              Icons.notifications,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(
          width: 20,
        )
      ],
    );
  }
}
