import 'package:flutter/material.dart';
import 'package:quizee_app/quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class Quiz extends StatefulWidget {
  const Quiz({Key? key}) : super(key: key);

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  List<Widget> score = [];
  QuizBrain quizBrain = QuizBrain();
  int num = 0;
  Future<void> checkAnswer(bool userAnswer) async {
    bool correctAnswer = quizBrain.getAnswer();
    quizBrain.nextQuestion();

    setState(() {
      if (correctAnswer == userAnswer) {
        print('correct................');
        score.add(const Icon(
          Icons.check,
          color: Color(0xff044b04),
        ));
      } else {
        print('wrong.................');
        score.add(const Icon(
          Icons.close,
          color: Colors.red,
        ));
      }
    });
    if (quizBrain.isFinished()) {
      quizBrain.restart();
      await Future.delayed(const Duration(milliseconds: 500));
      Alert(
        context: context,
        type: AlertType.success,
        title: "questions finished",
        desc:
            "Close-ended questions are questions that have predetermined answers",
        buttons: [
          DialogButton(
            onPressed: () => Navigator.pop(context),
            width: 120,
            child: const Text(
              "Try Aging",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          )
        ],
      ).show();
      setState(() {
        score = [];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.red, Colors.blue],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
                flex: 5,
                child: Center(
                  child: Text(
                    quizBrain.getQuestion(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                )),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                        child: ElevatedButton(
                      onPressed: () {
                        checkAnswer(true);
                      },
                      child: const Center(child: Text('True')),
                    )),
                    const SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            if (quizBrain.getAnswer() == false) {
                              print('wrong.................');
                              score.add(const Icon(
                                Icons.close,
                                color: Colors.red,
                              ));
                            } else {
                              print('correct................');
                              score.add(Image.asset(
                                'assets/images/icons8-select-checkmark-symbol-to-choose-true-answer-24.png',
                                color: const Color(0xff044b04),
                              ));
                            }
                          });
                          quizBrain.nextQuestion();
                        },
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.red,
                          ),
                          child: const Center(child: Text('False')),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Row(
                children: score,
              ),
            )
          ],
        ),
      )),
    );
  }
}
