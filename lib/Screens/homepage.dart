import 'package:flutter/material.dart';
import 'package:myquezapp/covidsimptom.dart';
import 'report.dart';
import 'rounded_button.dart';

QuestionBrain quizBrain = QuestionBrain();

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "Covid Checker",
          ),
        ),
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int questionNumber = 0;

  void checkAnswer() {
    setState(() {
      if (quizBrain.isFinished() == true) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Report(questionNumber)),
        );

        quizBrain.reset();
      } else {
        quizBrain.nextQuestion();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      //mainAxisAlignment: MainAxisAlignment.center,
      //crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
            child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/covid3.png'),
              fit: BoxFit.fitHeight,
            ),
            //shape: BoxShape.circle,
          ),
        )),
        Expanded(
          child: Container(
            padding: EdgeInsets.all(30.0),
            alignment: Alignment.center,
            child: Text(quizBrain.getQuestionText(),
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.normal)),
            margin: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: Colors.blueAccent,
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: RoundedButton(
                  text: 'Yes',
                  colour: Colors.redAccent,
                  onPressed: () {
                    setState(() {
                      questionNumber++;
                      checkAnswer();
                    });
                  },
                ),
              ),
              Expanded(
                child: RoundedButton(
                  text: 'No',
                  colour: Colors.green,
                  onPressed: () {
                    setState(() {
                      checkAnswer();
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
