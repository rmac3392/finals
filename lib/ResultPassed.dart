import 'package:finals/Questionaire.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ResultPassed extends StatefulWidget {
  int score;
  ResultPassed({
    Key? key,
    required this.score,
  }) : super(key: key);
  @override
  State<ResultPassed> createState() => _ResultState();
}

class _ResultState extends State<ResultPassed> {
  late int score = widget.score;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff1DC3A5),
          foregroundColor: const Color(0xFFfefefe),
          leading: InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Questionare()));
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
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: <TextSpan>[
                const TextSpan(
                  text: "Congratulations! You Passed\n",
                  style: TextStyle(
                    color: Color(0xff1DC3A5),
                    fontSize: 32,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                TextSpan(
                  text: score.toString(),
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Center(
            child: SvgPicture.asset(
              'assets/images/congrats.svg',
              width: 350, //
              height: 350,
            ),
          ),
        ] //
            ),
      ),
    );
  }
}
