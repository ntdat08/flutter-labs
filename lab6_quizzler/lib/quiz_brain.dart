import 'question.dart';

class QuizBrain {
  int _questionNumber = 0;

  final List<Question> _questionBank = [
    Question(
      questionText: 'Thu do cua Viet Nam la Ha Noi.',
      questionAnswer: true,
    ),
    Question(
      questionText: 'Mat troi moc o huong Tay va lan o huong Dong.',
      questionAnswer: false,
    ),
    Question(
      questionText: 'Flutter la framework do Google phat trien bang ngon ngu Dart.',
      questionAnswer: true,
    ),
    Question(
      questionText: 'Con nguoi co tong cong 5 giac quan co ban.',
      questionAnswer: true,
    ),
    Question(
      questionText: 'So nguyen to chan duy nhat la so 4.',
      questionAnswer: false,
    ),
    Question(
      questionText: 'Nuoc soi o nhiet do 100 do C trong dieu kien ap suat tieu chuan.',
      questionAnswer: true,
    ),
    Question(
      questionText: 'Ca voi la mot loai ca.',
      questionAnswer: false,
    ),
  ];

  void nextQuestion() {
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
    }
  }

  String getQuestionText() {
    return _questionBank[_questionNumber].questionText;
  }

  bool getCorrectAnswer() {
    return _questionBank[_questionNumber].questionAnswer;
  }

  bool isFinished() {
    return _questionNumber >= _questionBank.length - 1;
  }

  void reset() {
    _questionNumber = 0;
  }

  int getTotalQuestions() {
    return _questionBank.length;
  }
}
