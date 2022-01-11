import 'package:flutter/material.dart';
import 'package:quizzler_flutter/components/questions.dart';

import 'package:quizzler_flutter/widgets/widgets.dart';
import 'package:quizzler_flutter/components/components.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  final scoreKeeper = <Widget>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 5,
                child: CenterText(
                  text: QuizBrain.getQuestion().questionText,
                ),
              ),
              Expanded(
                child: BooleanButtom(
                  text: 'True',
                  color: Colors.green[300],
                  onPressed: () {
                    checkAnswer(true);
                  },
                ),
              ),
              Expanded(
                child: BooleanButtom(
                  text: 'False',
                  color: Colors.red[300],
                  onPressed: () {
                    checkAnswer(false);
                  },
                ),
              ),
              SizedBox(
                height: 60,
                child: Row(
                  children: scoreKeeper,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void checkAnswer(bool userAnswer) {
    if (!QuizBrain.isFinished) {
      if (QuizBrain.getQuestion().questionAnswer == userAnswer) {
        QuizBrain.updateScore();
        setState(() {
          scoreKeeper.add(const CheckIcon());
        });
      } else {
        setState(() {
          scoreKeeper.add(const CancelIcon());
        });
      }

      QuizBrain.nextQuestion();
    }

    if (QuizBrain.isFinished) {
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return CustomDialog(onPressed: resetQuiz);
        },
      );
    }
  }

  void resetQuiz() {
    setState(() {
      scoreKeeper.clear();
    });
    QuizBrain.reset();
    Navigator.of(context).pop();
  }
}
