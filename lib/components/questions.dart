class QuizBrain {
  static int _questionIndex = 0;
  static int _score = 0;
  static int _countAnswers = 0;

  static const questionBank = <_Question>[
    _Question(
        questionText: 'Some cats are actually allergic to humans',
        questionAnswer: true),
    _Question(
      questionText: 'You can lead a cow down stairs but not up stairs.',
      questionAnswer: false,
    ),
    _Question(
      questionText: 'Approximately one quarter of human bones are in the feet.',
      questionAnswer: true,
    ),
    _Question(
      questionText: 'A slug\'s blood is green.',
      questionAnswer: true,
    ),
    _Question(
      questionText: 'Buzz Aldrin\'s mother\'s maiden name was "Moon".',
      questionAnswer: true,
    ),
    _Question(
      questionText: 'It is illegal to pee in the Ocean in Portugal.',
      questionAnswer: true,
    ),
    _Question(
      questionText:
          'No piece of square dry paper can be folded in half more than 7 times.',
      questionAnswer: false,
    ),
    _Question(
      questionText:
          'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
      questionAnswer: true,
    ),
    _Question(
      questionText:
          'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
      questionAnswer: false,
    ),
    _Question(
      questionText:
          'The total surface area of two human lungs is approximately 70 square metres.',
      questionAnswer: true,
    ),
    _Question(
      questionText: 'Google was originally called "Backrub".',
      questionAnswer: true,
    ),
    _Question(
      questionText:
          'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',
      questionAnswer: true,
    ),
    _Question(
      questionText:
          'In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.',
      questionAnswer: true,
    ),
  ];

  static _Question getQuestion() {
    final question = questionBank[_questionIndex];
    return question;
  }

  static void nextQuestion() {
    _countAnswers++;
    if (_questionIndex < questionBank.length - 1) {
      _questionIndex++;
    }
  }

  static void updateScore() {
    _score++;
  }

  static bool get isFinished => _countAnswers == questionBank.length;

  static int get score => _score;

  static void reset() {
    _questionIndex = 0;
    _score = 0;
    _countAnswers = 0;
  }
}

class _Question {
  final String questionText;
  final bool questionAnswer;

  const _Question({
    required this.questionText,
    required this.questionAnswer,
  });
}
