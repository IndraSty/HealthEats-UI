import 'package:flutter/material.dart';
import 'package:healtheats/core/utils/constants.dart';
import 'package:healtheats/presentation/providers/deteksi_provider.dart';
import 'package:healtheats/presentation/widgets/box/question_choice_box.dart';
import 'package:provider/provider.dart';

class QuestionPage extends StatefulWidget {
  const QuestionPage({super.key});

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  // late bool onSelect = false;
  // late bool onLastQ = false;
  int selectedChoice = -1;
  int currentQuestion = 0;
  List<int> scores = [];
  List<Map<String, dynamic>> theQuestions = questions;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Question Page',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back),
        ),
        leadingWidth: 70,
      ),
      body: Quiz(),
    );
  }
}

class Quiz extends StatefulWidget {
  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  int selectedChoice = -1;
  late List<dynamic> _answers;
  final _pageController = PageController();
  late List<TextEditingController> _textControllers;
  bool isNumeric(String s) {
    return double.tryParse(s) != null;
  }

  @override
  void initState() {
    super.initState();
    _answers = List<dynamic>.filled(inputQuestions.length, null);
    _textControllers = List<TextEditingController>.generate(
      inputQuestions.length,
      (index) => TextEditingController(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: _pageController,
      itemCount: inputQuestions.length,
      itemBuilder: (context, index) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: AppScreenSize.height * 0.08,
              ),
              Text(
                inputQuestions[index]['question'] as String,
                style: Theme.of(context).textTheme.headlineSmall,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: AppScreenSize.height * 0.08,
              ),
              if (inputQuestions[index]['inputType'] != 'textfield')
                ...(inputQuestions[index]['answers'] as List<String>)
                    .map((String answer) {
                  int answerIndex =
                      (inputQuestions[index]['answers'] as List<String>)
                          .indexOf(answer);
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _answers[index] = (inputQuestions[index]['values']
                              as List<int>)[answerIndex];
                        });
                        print((inputQuestions[index]['values']
                            as List<int>)[answerIndex]);
                        setState(() {
                          selectedChoice = answerIndex;
                        });
                      },
                      child: QuestionChoiceBox(
                        onSelect: selectedChoice == answerIndex,
                        question: answer,
                      ),
                    ),
                  );
                }).toList(),
              if (inputQuestions[index]['inputType'] == 'textfield')
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: TextFormField(
                    controller: _textControllers[index],
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Masukkan angka',
                    ),
                    onChanged: (value) {
                      setState(() {
                        _answers[index] = value.isEmpty
                            ? null
                            : isNumeric(value)
                                ? int.parse(value)
                                : null;
                      });
                    },
                  ),
                ),
              Row(
                mainAxisAlignment: index == 0
                    ? MainAxisAlignment.center
                    : MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  if (index > 0)
                    SizedBox(
                      height: 40,
                      width: 110,
                      child: OutlinedButton(
                        onPressed: () {
                          _pageController.previousPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.ease,
                          );
                        },
                        style: OutlinedButton.styleFrom(
                          foregroundColor: AppColors.textGray,
                          side: const BorderSide(
                            color: AppColors.primaryColor,
                          ), // Mengatur warna border
                        ),
                        child: const Text('Previous'),
                      ),
                    ),
                  if (index < inputQuestions.length - 1)
                    index == 0
                        ? Expanded(
                            child: SizedBox(
                              height: 50,
                              child: ElevatedButton(
                                onPressed: _answers[index] != null
                                    ? () {
                                        _pageController.nextPage(
                                          duration:
                                              const Duration(milliseconds: 500),
                                          curve: Curves.ease,
                                        );
                                        print(_answers);
                                        setState(() {
                                          selectedChoice = -1;
                                        });
                                      }
                                    : null,
                                style: ButtonStyle(
                                  backgroundColor:
                                      WidgetStateProperty.resolveWith<Color>(
                                    (Set<WidgetState> states) {
                                      if (states
                                          .contains(WidgetState.disabled)) {
                                        return AppColors.greyBg;
                                      }
                                      return AppColors.primaryColor;
                                    },
                                  ),
                                  foregroundColor:
                                      WidgetStateProperty.resolveWith<Color>(
                                    (Set<WidgetState> states) {
                                      if (states
                                          .contains(WidgetState.disabled)) {
                                        return AppColors.textMini;
                                      }
                                      return Colors.white;
                                    },
                                  ),
                                ),
                                child: const Text('Next'),
                              ),
                            ),
                          )
                        : SizedBox(
                            height: 40,
                            width: 110,
                            child: ElevatedButton(
                              onPressed: _answers[index] != null
                                  ? () {
                                      _pageController.nextPage(
                                        duration:
                                            const Duration(milliseconds: 500),
                                        curve: Curves.ease,
                                      );
                                      print(_answers);
                                      setState(() {
                                        selectedChoice = -1;
                                      });
                                    }
                                  : null,
                              style: ButtonStyle(
                                backgroundColor:
                                    WidgetStateProperty.resolveWith<Color>(
                                  (Set<WidgetState> states) {
                                    if (states.contains(WidgetState.disabled)) {
                                      return AppColors.greyBg;
                                    }
                                    return AppColors.primaryColor;
                                  },
                                ),
                                foregroundColor:
                                    WidgetStateProperty.resolveWith<Color>(
                                  (Set<WidgetState> states) {
                                    if (states.contains(WidgetState.disabled)) {
                                      return AppColors.textMini;
                                    }
                                    return Colors.white;
                                  },
                                ),
                              ),
                              child: const Text('Next'),
                            ),
                          ),
                  if (index == inputQuestions.length - 1)
                    SizedBox(
                      height: 40,
                      width: 110,
                      child: ElevatedButton(
                        onPressed: _answers[index] != null
                            ? () {
                                print(_answers);
                                setState(() {
                                  selectedChoice = -1;
                                });
                                Provider.of<DeteksiProvider>(context,
                                        listen: false)
                                    .fetchPredictionAndRecommend(_answers);
                                Navigator.pushReplacementNamed(
                                    context, '/result-diagnos');
                              }
                            : null,
                        style: ButtonStyle(
                          foregroundColor:
                              WidgetStateProperty.resolveWith<Color>(
                            (Set<WidgetState> states) {
                              if (states.contains(WidgetState.disabled)) {
                                return AppColors.textMini;
                              }
                              return Colors.white;
                            },
                          ),
                          backgroundColor:
                              WidgetStateProperty.resolveWith<Color>(
                            (Set<WidgetState> states) {
                              if (states.contains(WidgetState.disabled)) {
                                return AppColors.greyBg;
                              }
                              return AppColors.primaryColor;
                            },
                          ),
                        ),
                        child: const Text('Submit'),
                      ),
                    ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
