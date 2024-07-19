import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:healtheats/core/utils/constants.dart';
import 'package:healtheats/core/utils/util.dart';
import 'package:healtheats/presentation/providers/user_provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class MyAccountPage extends StatefulWidget {
  const MyAccountPage({super.key});

  @override
  State<MyAccountPage> createState() => _MyAccountPageState();
}

class _MyAccountPageState extends State<MyAccountPage> {
  // final UserService service = UserService();

  Uint8List? _image;

  void selectImage() async {
    Uint8List img = await pickImage(ImageSource.gallery);
    setState(() {
      _image = img;
    });
  }

  void saveImage() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: AppBar(
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back),
            ),
            title: Text(
              'Akun Saya',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            centerTitle: true,
          ),
        ),
        body: Consumer<UserProvider>(builder: (context, value, child) {
          final user = value.user;
          final TextEditingController name =
              TextEditingController(text: user!.name);
          return Container(
            width: double.infinity,
            decoration: const BoxDecoration(color: AppColors.greyBg),
            child: Column(
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
                          height: 200,
                          width: 200,
                          decoration: BoxDecoration(
                            color: Colors.teal,
                            shape: BoxShape.circle,
                            image: _image != null
                                ? DecorationImage(
                                    image: MemoryImage(_image!),
                                    fit: BoxFit.cover,
                                  )
                                : user.image != ''
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
                          child: Stack(
                            children: [
                              Positioned(
                                bottom: 0,
                                right: 10,
                                child: Container(
                                  height: 50,
                                  width: 50,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppColors.primaryColor,
                                  ),
                                  child: IconButton(
                                    onPressed: () => selectImage(),
                                    icon: const Icon(
                                      Icons.edit,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      child: Stack(
                        children: [
                          Column(
                            children: [
                              emailContainer(user.email),
                              const SizedBox(
                                height: 20,
                              ),
                              Container(
                                width: double.infinity,
                                height: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                ),
                                child: TextField(
                                  controller: name,
                                  style:
                                      Theme.of(context).textTheme.labelMedium,
                                  keyboardType: TextInputType.name,
                                  cursorColor: AppColors.textGray,
                                  decoration: const InputDecoration(
                                    contentPadding:
                                        EdgeInsets.symmetric(vertical: 15),
                                    border: InputBorder.none,
                                    prefixIcon: Icon(
                                      Icons.person_outline,
                                      size: 24,
                                      color: AppColors.primaryColor,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          Positioned(
                            bottom: 20,
                            left: 0,
                            right: 0,
                            child: GestureDetector(
                              onTap: () async {
                                // bool updateSuccess = await service.updateUser(
                                //     name.text.trim(), _image!, context);
                                // if (updateSuccess) {
                                //   setState(() {
                                //     Provider.of<UserDataProvider>(context,
                                //             listen: false)
                                //         .getUser();
                                //   });
                                // }
                              },
                              child: Container(
                                width: double.infinity,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: AppColors.primaryColor,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                  child: Text(
                                    'Simpan',
                                    style:
                                        AppTextStyles.poppins_14_semibold_white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ]),
          );
        }));
  }

  Container emailContainer(String email) {
    return Container(
      width: double.infinity,
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Row(
        children: [
          const Icon(
            Icons.email_outlined,
            color: AppColors.primaryColor,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            email,
            style: AppTextStyles.poppins_12_medium_gray,
          ),
        ],
      ),
    );
  }
}
