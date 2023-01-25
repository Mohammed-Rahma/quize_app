import 'package:flutter/material.dart';
import 'package:quizee_app/quiz_brain.dart';

class Quiz extends StatefulWidget {
  const Quiz({Key? key}) : super(key: key);

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  List<Widget> score = [];
  QuizBrain quizBrain = QuizBrain();

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
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            if (quizBrain.getAnswer() == true) {
                              print('correct................');
                              score.add(Image.asset(
                                'assets/images/icons8-select-checkmark-symbol-to-choose-true-answer-24.png',
                                color: const Color(0xff044b04),
                              ));
                            } else {
                              print('wrong.................');
                              score.add(const Icon(
                                Icons.close,
                                color: Colors.red,
                              ));
                            }
                          });
                          quizBrain.nextQuestion();
                        },
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.green,
                          ),
                          child: const Center(child: Text('True')),
                        ),
                      ),
                    ),
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
