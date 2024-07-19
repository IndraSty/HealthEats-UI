import 'package:flutter/material.dart';
import 'package:healtheats/core/utils/constants.dart';
import 'package:healtheats/presentation/providers/user_provider.dart';
import 'package:healtheats/presentation/widgets/box/profile_item_box.dart';
import 'package:healtheats/presentation/widgets/button/logout_button.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<UserProvider>(context, listen: false).get();
    });
  }

  @override
  Widget build(BuildContext context) {
    // AuthProvider authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          title: Text(
            'Profile',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          centerTitle: true,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: AppScreenSize.width,
          decoration: const BoxDecoration(color: AppColors.greyBg),
          child: Consumer<UserProvider>(builder: (context, value, child) {
            final user = value.user;
            return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    color: Colors.white,
                    width: double.infinity,
                    height: AppScreenSize.height * 0.32,
                    child: Column(
                      children: [
                        SizedBox(
                          height: AppScreenSize.height * 0.05,
                        ),
                        Container(
                          height: 150,
                          width: 150,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: user!.image != ''
                                ? DecorationImage(
                                    image: NetworkImage(user.image),
                                    fit: BoxFit.cover,
                                  )
                                : const DecorationImage(
                                    image: AssetImage(
                                        'assets/images/def_avatar_1.png'),
                                    fit: BoxFit.cover,
                                  ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          user.name,
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        Text(
                          user.email,
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/my-account');
                          },
                          child: const ProfileItemBox(
                            icon: Icons.person_outline,
                            title: 'Akun Saya',
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const ProfileItemBox(
                          icon: Icons.notifications_outlined,
                          title: 'Notifikasi',
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const ProfileItemBox(
                          icon: Icons.bookmark_outline,
                          title: 'Favorite',
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        const ProfileItemBox(
                          icon: Icons.description,
                          title: 'Syarat & Ketentuan',
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const ProfileItemBox(
                          icon: Icons.help_outline,
                          title: 'Bantuan',
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            // authProvider.logout();
                          },
                          child: const LogoutButton(),
                        )
                      ],
                    ),
                  )
                ]);
          }),
        ),
      ),
    );
  }
}
