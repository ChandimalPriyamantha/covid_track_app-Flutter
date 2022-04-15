import 'question.dart';

class QuestionBrain {
  int _questionNumber = 0;
  List<Question> _questionBank = [
    Question('Are you suffering from fever?', true, false),
    Question('Are you suffering from cough?', true, false),
    Question('Are you suffering from tiredness?', true, false),
    Question('Are you suffering from loss of taste or smell?', true, false),
    Question('Are you suffering from sore throat?', true, false),
    Question('Are you suffering from headache?', true, false),
    Question('Are you suffering from aches and pains?', true, false),
    Question('Are you suffering from diarrhoea?', true, false),
    Question(
        'Are you suffering from a rash on skin, or discolouration of fingers or toes?',
        true,
        false),
    Question('Are you suffering from red or irritated eyes?', true, false),
    Question(
        'Are you suffering from difficulty breathing or shortness of breath?',
        true,
        false),
    Question('Are you suffering from loss of speech or mobility, or confusion?',
        true, false),
    Question('Are you suffering from chest pain?', true, false),
  ];

  void nextQuestion() {
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
    }
  }

  String getQuestionText() {
    return _questionBank[_questionNumber].questionText;
  }

  bool getCorrectAnswerYes() {
    return _questionBank[_questionNumber].questionAnswerYes;
  }

  bool getCorrectAnswerNo() {
    return _questionBank[_questionNumber].questionAnswerNo;
  }

  bool isFinished() {
    if (_questionNumber >= _questionBank.length - 1) {
      //TODO: Step 3 Part B - Use a print statement to check that isFinished is returning true when you are indeed at the end of the quiz and when a restart should happen.

      print('Now returning true');
      return true;
    } else {
      return false;
    }
  }

  //TODO: Step 4 part B - Create a reset() method here that sets the questionNumber back to 0.
  void reset() {
    _questionNumber = 0;
  }
}
