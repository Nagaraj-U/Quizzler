import 'package:flutter/material.dart';
import 'Question.dart';
import 'QuizBrain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
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

  List<Icon> scorekeeper=[];
//
////  List questions=[
////    'You can lead a cow down stairs but not up stairs.',
////    'Approximately one quarter of human bones are in the feet.',
////    'A slug\'s blood is green.'
////  ];
////
////  List<bool> answers=[
////    false,
////    true,
////    true,
////  ];
//
// // Question q1=Question(q :  'You can lead a cow down stairs but not up stairs.',a :false);
//
//  List<Question> questionBank=[
//  Question(q : 'You can lead a cow down stairs but not up stairs.', a :false),
//  Question(q : 'Approximately one quarter of human bones are in the feet.', a :true),
//  Question(q : 'A slug\'s blood is green.',a :true),
//
//  ];

QuizBrain quizBrain = QuizBrain();

void checkAnswer(bool pickedAnswer){

  bool correctAnswer = quizBrain.getCorrectAnswer();
  setState(() {

    if (quizBrain.isFinished() == true) {

      Alert(
        context: context,
        title: 'Finished!',
        desc: 'You\'ve reached the end of the quiz.',
      ).show();

      //TODO Step 4 Part C - reset the questionNumber,
      quizBrain.reset();

      //TODO Step 4 Part D - empty out the scoreKeeper.
      scorekeeper = [];
    }

    else{
      if ( correctAnswer == pickedAnswer){
        //print("user got it correct");
        scorekeeper.add(
            Icon(
              Icons.check,
              color: Colors.green,
            )
        );
      }else{
        //print("user got it wrong");
        scorekeeper.add(Icon(Icons.close,color: Colors.red,),);
      }

      //questionNumber++;
      quizBrain.nextQuestion();

    }
  });
}

  //int questionNumber=0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizBrain.getQuestionText(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.green,
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
//                //The user picked true.
//                bool correctAnswer = quizBrain.getCorrectAnswer();
//                if ( correctAnswer == true){
//                  print("user got it correct");
//                }else{
//                  print("user got it wrong");
//                }
//                setState(() {
//                  //questionNumber++;
//                  quizBrain.nextQuestion();
//                });
              checkAnswer(true);
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red,
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                //The user picked false.
//                bool correctAnswer = quizBrain.getCorrectAnswer();
//                if ( correctAnswer == false){
//                  print("user got it correct");
//                }else{
//                  print("user got it wrong");
//                }
//
//                setState(() {
////                  questionNumber++;
//                  quizBrain.nextQuestion();
//                });
              checkAnswer(false);
              },
            ),
          ),
        ),
        Row(
          children: scorekeeper,
        )
      ],
    );
  }
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/
