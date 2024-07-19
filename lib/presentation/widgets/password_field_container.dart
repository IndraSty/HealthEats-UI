import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healtheats/core/utils/constants.dart';

class PasswordFieldContainer extends StatelessWidget {
  const PasswordFieldContainer({
    super.key,
    required this.passwordToggle,
    required this.controller,
    required this.secureText,
  });

  final void Function() passwordToggle;
  final TextEditingController controller;
  final bool secureText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: double.infinity,
          child: Center(
            child: FormField<String>(
              builder: (FormFieldState<String> field) {
                final errorText = field.errorText;
                final borderSide = errorText != null
                    ? const BorderSide(
                        color: AppColors.dangerColor,
                        width: 2.0,
                      )
                    : const BorderSide(
                        color: AppColors.primaryColor,
                        width: 1.0,
                      );
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      controller: controller,
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        color: AppColors.textGray,
                        fontWeight: FontWeight.w600,
                      ),
                      obscureText: secureText,
                      cursorColor: AppColors.textGray,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: borderSide,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: borderSide,
                        ),
                        prefixIcon: Icon(
                          Icons.lock,
                          size: 24,
                          color: errorText != null
                              ? AppColors.dangerColor
                              : AppColors.primaryColor,
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            secureText
                                ? Icons.remove_red_eye
                                : Icons.remove_red_eye_outlined,
                            size: 24,
                            color: errorText != null
                                ? AppColors.dangerColor
                                : AppColors.primaryColor,
                          ),
                          onPressed: passwordToggle,
                        ),
                        hintText: 'min. 8 karakter',
                        hintStyle: GoogleFonts.poppins(
                          fontSize: 12,
                          color: AppColors.textGray,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      onChanged: (value) {
                        field.didChange(value);
                      },
                    ),
                    if (field.hasError)
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Text(
                          field.errorText ?? '',
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            color: Colors.red,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                  ],
                );
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Password tidak boleh kosong";
                } else if (value.length < 8) {
                  return "Password harus minimal 8 karakter";
                } else if (!RegExp(r'^(?=.*[A-Z])(?=.*\d).*$')
                    .hasMatch(value)) {
                  return "Password harus mengandung 1 huruf besar dan 1 angka";
                }
                return null;
              },
            ),
          ),
        ),
      ],
    );
  }
}
