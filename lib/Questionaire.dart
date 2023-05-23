import 'dart:math';
// Quiz().q[0].question.toString(),
//int id, String question, List choices
import 'package:finals/Choices.dart';
import 'package:finals/Login.dart';
import 'package:finals/ResultPassed.dart';
import 'package:finals/ResultFailed.dart';
import 'package:get/get.dart';
import 'Tile.dart';
import 'package:flutter/material.dart';
import 'ChoicesController.dart';
import 'Score.dart';

void route() {
  int score = 0;
  List<int> correctAnswer = [1, 0, 0, 2, 2, 0, 1, 3, 1, 2];
  Get.put(ChoicesController());
  final ChoicesController choicesController = Get.find<ChoicesController>();
  List<int> myAnswer = choicesController.choosen;
  Score myScore = Score(score);
  for (int i = 0; i < correctAnswer.length; i++) {
    if (correctAnswer[i] == myAnswer[i]) {
      score++;
    }
  }
  if (score >= 7) {
    Get.to(() => ResultPassed(score: score));
  } else {
    Get.to(() => ResultFailed(score: score,));
  }
}

class Questionare extends StatefulWidget {
  const Questionare({super.key});

  @override
  State<Questionare> createState() => _QuestionareState();
}

class _QuestionareState extends State<Questionare> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff1DC3A5),
        foregroundColor: const Color(0xFFfefefe),
        leading: InkWell(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Login()));
          },
          child: const Icon(
            Icons.arrow_back_sharp,
            size: 35,
          ),
        ),
        title: const Text(
          "Macawili, Ryan James",
          style: TextStyle(fontSize: 25),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: List.generate(10, (index) => Tile(id: index)),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          route();
        },
        backgroundColor: const Color(0xff1DC3A5),
        child: const Icon(Icons.check),
      ),
    );
  }
}
