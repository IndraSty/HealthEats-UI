import 'package:flutter/material.dart';
import 'package:healtheats/config/routes/app_routes.dart';
import 'package:healtheats/core/utils/constants.dart';
import 'package:healtheats/presentation/providers/auth_provider.dart';
import 'package:healtheats/presentation/widgets/fixed_bottom_text.dart';
import 'package:healtheats/presentation/widgets/password_field_container.dart';
import 'package:healtheats/presentation/widgets/textfield_container.dart';
import 'package:healtheats/presentation/widgets/wide_button.dart';
import 'package:provider/provider.dart';

class DaftarPage extends StatefulWidget {
  const DaftarPage({super.key});

  @override
  State<DaftarPage> createState() => _DaftarPageState();
}

class _DaftarPageState extends State<DaftarPage> {
  final formKey = GlobalKey<FormState>();
  bool secureText = true;
  final email = TextEditingController();
  final name = TextEditingController();
  final password = TextEditingController();

  void passwordToggle() {
    setState(() {
      secureText = !secureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      body: authProvider.isLoading
          ? const Center(
              child: CircularProgressIndicator(
                color: AppColors.primaryColor,
              ),
            )
          : SingleChildScrollView(
              child: Container(
                width: AppScreenSize.width,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: AppScreenSize.height * 0.1,
                    ),
                    Image.asset(
                      'assets/images/the_logo.png',
                      width: 120,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      'Silahkan Login dengan akun anda!',
                      style: AppTextStyles.poppins_14_reguler,
                    ),
                    SizedBox(
                      height: AppScreenSize.height * 0.1,
                    ),
                    Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Fullname',
                            style: AppTextStyles.poppins_14_bold,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          TextFieldContainer(
                            controller: name,
                            hint: "Nama Anda",
                            icon: Icons.person_outline,
                            keyboardType: TextInputType.name,
                            validator: (value) {
                              if (value!.isEmpty ||
                                  !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                                return "Nama anda tidak valid";
                              } else {
                                return null;
                              }
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Email',
                            style: AppTextStyles.poppins_14_bold,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          TextFieldContainer(
                            controller: email,
                            hint: 'example@gmail.com',
                            icon: Icons.email_outlined,
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Email tidak boleh kosong";
                              } else if (!RegExp(
                                      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,}$')
                                  .hasMatch(value)) {
                                return "Email anda tidak valid";
                              } else {
                                return null;
                              }
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),

                          Text(
                            'Password',
                            style: AppTextStyles.poppins_14_bold,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          PasswordFieldContainer(
                            passwordToggle: passwordToggle,
                            controller: password,
                            secureText: secureText,
                          ),

                          const SizedBox(
                            height: 30,
                          ),

                          //button
                          GestureDetector(
                            onTap: () async {
                              if (formKey.currentState!.validate()) {
                                await authProvider.register(
                                  email.text.trim(),
                                  name.text.trim(),
                                  password.text.trim(),
                                );
                              }
                            },
                            child: const WideButton(text: 'Daftar'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
      bottomNavigationBar: FixedBottomText(
        onTap: () {
          Navigator.pushNamed(context, AppRoutes.login);
        },
        text: "Sudah punya akun? ",
        textButton: "Masuk",
      ),
    );
  }
}
