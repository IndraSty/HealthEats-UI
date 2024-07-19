import 'package:flutter/material.dart';
import 'package:healtheats/core/utils/constants.dart';
import 'package:image_picker/image_picker.dart';

pickImage(ImageSource source) async {
  final ImagePicker imagePicker = ImagePicker();
  XFile? file = await imagePicker.pickImage(source: source);
  if (file != null) {
    return file.readAsBytes();
  }
  print("No Image Selected!");
}

void showLoadingDialog(BuildContext context) {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) => const Center(
      child: CircularProgressIndicator(
        color: AppColors.primaryColor,
        backgroundColor: Colors.blueGrey,
      ),
    ),
  );
}

void hideLoadingDialog(BuildContext context) {
  if (Navigator.canPop(context)) {
    Navigator.of(context, rootNavigator: true).pop();
  }
}
