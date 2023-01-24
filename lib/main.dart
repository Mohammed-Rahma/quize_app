import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const Quiz());
  }
}

class Quiz extends StatefulWidget {
  const Quiz({Key? key}) : super(key: key);

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  List<Widget> score = [];

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
                  child: Text('This is where the question text will go '),
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
                            score.add(Image.asset(
                              'assets/images/icons8-select-checkmark-symbol-to-choose-true-answer-24.png',
                              color: Color(0xff044b04),
                            ));
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.green,
                          ),
                          child: Center(child: const Text('True')),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            score.add(Icon(
                              Icons.close,
                              color: Colors.red,
                            ));
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.red,
                          ),
                          child: Center(child: const Text('False')),
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
