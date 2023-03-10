import 'package:quizee_app/question.dart';

class QuizBrain {
  int num = 0;
  final List<Question> _questions = [
    Question(
        'Sea otters have a favorite rock they use to break open food.', false),
    Question('Polo takes up the largest amount of space in terms of land area.',
        true),
    Question(
        'Prince Eric and Ariel from The Little Mermaid have a daughter named Princess Song.',
        false)
  ];

  void nextQuestion() {
    if (num <= _questions.length - 1) num++;
  }

  String getQuestion() {
    return _questions[num].question;
  }

  bool getAnswer() {
    return _questions[num].answer;
  }

  bool isFinished() {
    if (num > _questions.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  void restart() {
    num = 0;
  }
}
