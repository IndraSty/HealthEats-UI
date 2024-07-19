import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static const primaryColor = Color(0xff3EC9A8);
  static const fontColor = Color(0xff141414);
  static const textGray = Color(0xff7A7A7A);
  static const textMini = Color(0xffBCBBBB);
  static const dangerColor = Color(0xffFF6262);
  static const dotColor = Color(0xffEFEFEF);
  static const miniBox = Color(0xff6EDAC1);
  static const greyBg = Color(0xffF1F1F1);
  static const white = Color(0xffFFFFFF);
  static const shimmer = Color(0xffECECEC);
}

class AppScreenSize {
  static final double height =
      MediaQueryData.fromView(WidgetsBinding.instance.window).size.height;
  static final double width =
      MediaQueryData.fromView(WidgetsBinding.instance.window).size.width;
}

class AppTextStyles {
  static final TextStyle poppins_10_reguler_gray = GoogleFonts.poppins(
    fontSize: 10,
    fontWeight: FontWeight.w400,
    color: AppColors.textGray,
  );
  static final TextStyle poppins_10_medium_primary = GoogleFonts.poppins(
    fontSize: 10,
    fontWeight: FontWeight.w500,
    color: AppColors.primaryColor,
  );

  static final TextStyle poppins_14_bold = GoogleFonts.poppins(
    fontSize: 14,
    color: AppColors.fontColor,
    fontWeight: FontWeight.w600,
  );

  static final TextStyle poppins_14_reguler = GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );
  static final TextStyle poppins_14_reguler_gray = GoogleFonts.poppins(
    fontSize: 14,
    color: AppColors.textGray,
  );

  static final TextStyle poppins_14_semibold_gray = GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.textGray,
  );
  static final TextStyle poppins_14_semibold_white = GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColors.white,
  );

  static final TextStyle poppins_14_bold_primary = GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w700,
    color: AppColors.primaryColor,
  );

  static final TextStyle poppins_16_semibold = GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.fontColor,
  );
  static final TextStyle poppins_16_semibold_white = GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.white,
  );
  static final TextStyle poppins_16_bold_white = GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: Colors.white,
  );

  static final TextStyle poppins_12_medium_primary = GoogleFonts.poppins(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppColors.primaryColor,
  );

  static final TextStyle poppins_12_medium_white = GoogleFonts.poppins(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppColors.white,
  );
  static final TextStyle poppins_12_medium_danger = GoogleFonts.poppins(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppColors.dangerColor,
  );

  static final TextStyle poppins_12_reguler = GoogleFonts.poppins(
    fontSize: 12,
    fontWeight: FontWeight.w400,
  );
  static final TextStyle poppins_12_medium = GoogleFonts.poppins(
    fontSize: 12,
    fontWeight: FontWeight.w500,
  );

  static final TextStyle poppins_12_reguler_gray = GoogleFonts.poppins(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.textGray,
  );

  static final TextStyle poppins_12_medium_gray = GoogleFonts.poppins(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppColors.textGray,
  );

  static final TextStyle poppins_12_semibold_gray = GoogleFonts.poppins(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    color: AppColors.textGray,
  );

  static final TextStyle poppins_12_semibold_white = GoogleFonts.poppins(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    color: AppColors.white,
  );

  static final TextStyle poppins_18_bold = GoogleFonts.poppins(
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );

  static final TextStyle poppins_18_semibold = GoogleFonts.poppins(
    fontSize: 18.0,
    fontWeight: FontWeight.w600,
    color: AppColors.fontColor,
  );
  static final TextStyle poppins_18_semibold_white = GoogleFonts.poppins(
    fontSize: 18.0,
    fontWeight: FontWeight.w600,
    color: AppColors.white,
  );
}

List<Map<String, dynamic>> questions = [
  {
    'question':
        'Seberapa sering anda mengonsumsi alkohol dalam sehari terakhir?',
    'choices': [
      {'text': 'Jarang (1-2 kali)', 'score': 5},
      {'text': 'Sedang (3-5 kali)', 'score': 10},
      {'text': 'Sering ( > 6 kali)', 'score': 15},
    ],
  },
  {
    'question':
        'Seberapa sering anda mengonsumsi alkohol dalam sebulan terakhir?',
    'choices': [
      {'text': 'Jarang (1-2 kali)', 'score': 5},
      {'text': 'Sering ( > 6 kali)', 'score': 15},
      {'text': 'Sedang (3-5 kali)', 'score': 10},
    ],
  },
  {
    'question':
        'Seberapa sering anda mengonsumsi alkohol dalam Setahun terakhir?',
    'choices': [
      {'text': 'Sering ( > 6 kali)', 'score': 15},
      {'text': 'Sedang (3-5 kali)', 'score': 10},
      {'text': 'Jarang (1-2 kali)', 'score': 5},
    ],
  },
];

final inputQuestions = [
  {
    'question': 'Apa Jenis Kelamin Anda?',
    'answers': ['Pria', 'Wanita'],
    'values': [1, 0]
  },
  {
    'question': 'Berapa Usia Anda?',
    'inputType': 'textfield',
    'answer': [],
  },
  {
    'question': 'Apakah Anda Pernah Menikah?',
    'answers': ['Ya', 'Tidak', 'Belum Pernah Menikah'],
    'values': [2, 1, 0]
  },
  {
    'question': 'Apa Jenis Pekerjaan Anda?',
    'answers': [
      'Paruh Waktu',
      'Penuh Waktu',
      'Pekerja Lepas',
      'Pensiunan',
      'Lainnya'
    ],
    'values': [1, 2, 3, 4, 5]
  },
  {
    'question': 'Apa Tipe Tempat Tinggal Anda?',
    'answers': ['Perkotaan', 'Pedesaan', 'Lainnya'],
    'values': [1, 2, 3]
  },
  {
    'question': 'Berapa Indeks Massa Tubuh (BMI) Anda?',
    'answer': [],
    'inputType': 'textfield',
  },
  {
    'question': 'Apa Status Merokok Anda?',
    'answers': [
      'Tidak Pernah Merokok',
      'Mantan Perokok',
      'Perokok Sosial',
      'Perokok Aktif',
      'Perokok Berat'
    ],
    'values': [1, 2, 3, 4, 5]
  },
  {
    'question': 'Seberapa Aktif Anda Secara Fisik?',
    'answers': ['Tidak Aktif', 'Sedang', 'Aktif'],
    'values': [0, 1, 2]
  },
];

class Foods {
  final int id;
  final String name;
  final String desc;
  final String image;

  Foods({
    required this.id,
    required this.image,
    required this.name,
    required this.desc,
  });

  static List<Foods> allFood = [
    Foods(
        id: 1,
        image:
            'https://img.kurio.network/FJEY_di09bEOFHW1qPCwS87mjUI=/440x440/filters:quality(80)/https://kurio-img.kurioapps.com/22/09/26/ea665aec-bb3e-4232-9fa2-6b29197a5884.jpg',
        name: 'Pecel Lele Goreng',
        desc:
            'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Excepturi perspiciatis a ipsum aperiam non veniam sed, saepe nihil qui mollitia?.'),
    Foods(
        id: 2,
        image:
            'https://cdn0-production-images-kly.akamaized.net/Oxs86fs4YLhNy5tIAERv25rqhBQ=/0x0:1999x1127/1200x675/filters:quality(75):strip_icc():format(jpeg)/kly-media-production/medias/3256671/original/016360300_1601695315-salad_sayur.jpg',
        name: 'Salad Sayur Sehat',
        desc:
            'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Excepturi perspiciatis a ipsum aperiam non veniam sed, saepe nihil qui mollitia?.'),
    Foods(
        id: 3,
        image:
            'https://asset.kompas.com/crops/wRsyUwU7JekWNTa1tHXJE8q3_Vk=/36x31:660x447/750x500/data/photo/2020/12/08/5fcf880867366.jpg',
        name: 'Omelate',
        desc:
            'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Excepturi perspiciatis a ipsum aperiam non veniam sed, saepe nihil qui mollitia?.'),
  ];
}
