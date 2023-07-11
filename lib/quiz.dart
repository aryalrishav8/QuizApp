import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizapp/api_services.dart';
import 'colors.dart';
import 'homescreen.dart';
import 'lastscreen.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    quiz = getQuiz();
    points = 0;
    startTimer();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    timer!.cancel();
  }

  int seconds = 60;
  Timer? timer;
  var currentQuestionIndex = 0;
  late Future quiz;
  var isLoaded = false;
  var optionsList = [];
  var optionsColor = [
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
  ];
  int points = 0;

  startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (seconds > 0) {
          seconds--;
        } else {
          gotoNextQuestion();
        }
      });
    });
  }

  gotoNextQuestion() {
    isLoaded = false;
    currentQuestionIndex++;
    resetColors();
    timer!.cancel();
    seconds = 60;
    startTimer();
  }

  resetColors() {
    optionsColor = [
      Colors.white,
      Colors.white,
      Colors.white,
      Colors.white,
      Colors.white,
    ];
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
            width: double.infinity,
            height: double.infinity,
            padding: const EdgeInsets.all(12),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [blue, darkBlue]),
            ),
            child: FutureBuilder(
              future: quiz,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  var data = snapshot.data['results'];
                  if (isLoaded == false) {
                    optionsList =
                        data[currentQuestionIndex]['incorrect_answers'];
                    optionsList
                        .add(data[currentQuestionIndex]['correct_answer']);
                    optionsList.shuffle();
                    isLoaded = true;
                  }
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                border: Border.all(color: lightgrey, width: 2),
                              ),
                              child: IconButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            LastScreen(number: points),
                                      ));
                                },
                                icon: const Icon(
                                  CupertinoIcons.xmark,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ),
                            ),
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                Text(
                                  '$seconds',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                                SizedBox(
                                  width: 80,
                                  height: 80,
                                  child: CircularProgressIndicator(
                                    value: seconds / 60,
                                    valueColor: const AlwaysStoppedAnimation(
                                        Colors.white),
                                  ),
                                )
                              ],
                            ),
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: lightgrey, width: 2),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: TextButton.icon(
                                onPressed: () {},
                                icon: Icon(
                                  CupertinoIcons.heart_fill,
                                  color: Colors.white,
                                  size: 18,
                                ),
                                label: const Text(
                                  'Love',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Image(
                          image: AssetImage(
                            'assets/idea.png',
                          ),
                          width: 200,
                        ),
                        SizedBox(height: 20),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Question ${currentQuestionIndex + 1} of ${data.length}',
                            style: TextStyle(color: lightgrey, fontSize: 15),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          data[currentQuestionIndex]['question'],
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontFamily: GoogleFonts.inter().fontFamily),
                        ),
                        const SizedBox(height: 20),
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: optionsList.length,
                          itemBuilder: (context, index) {
                            var answer =
                                data[currentQuestionIndex]['correct_answer'];
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (answer.toString() ==
                                      optionsList[index].toString()) {
                                    optionsColor[index] = Colors.green;
                                    points = points + 10;
                                  } else {
                                    optionsColor[index] = Colors.red;
                                  }

                                  if (currentQuestionIndex < data.length - 1) {
                                    Future.delayed(Duration(milliseconds: 300),
                                        () {
                                      currentQuestionIndex++;
                                      resetColors();
                                      isLoaded = false;
                                      timer!.cancel();
                                      seconds = 60;
                                      startTimer();
                                    });
                                  } else {
                                    timer!.cancel();
                                    // print(points);
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              LastScreen(number: points),
                                        ));
                                  }
                                });
                              },
                              child: Container(
                                margin: EdgeInsets.only(bottom: 20),
                                alignment: Alignment.center,
                                width: size.width - 100,
                                padding: EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  color: optionsColor[index],
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Text(
                                  optionsList[index].toString(),
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                      fontFamily:
                                          GoogleFonts.inter().fontFamily),
                                ),
                              ),
                            );
                          },
                        )
                      ],
                    ),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(Colors.white),
                    ),
                  );
                }
              },
            )),
      ),
    );
  }
}
