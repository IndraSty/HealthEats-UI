import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healtheats/core/utils/constants.dart';

class TextFieldContainer extends StatelessWidget {
  const TextFieldContainer({
    super.key,
    required this.controller,
    required this.hint,
    required this.icon,
    required this.keyboardType,
    required this.validator,
  });

  final TextEditingController controller;
  final String hint;
  final IconData icon;
  final TextInputType keyboardType;
  final String? Function(String?) validator;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: AppScreenSize.width,
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
                      keyboardType: keyboardType,
                      cursorColor: AppColors.textGray,
                      decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.symmetric(vertical: 15),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: borderSide,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: borderSide,
                        ),
                        prefixIcon: Icon(
                          icon,
                          size: 24,
                          color: errorText != null
                              ? AppColors.dangerColor
                              : AppColors.primaryColor,
                        ),
                        hintText: hint,
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
              validator: validator,
            ),
          ),
        ),
      ],
    );
  }
}
