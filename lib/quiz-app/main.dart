import 'package:flutter/material.dart';

import 'package:first_app/quiz-app/quiz.dart';
import 'package:first_app/quiz-app/result.dart';

//void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {

  final _questions = [
    {
      'questionText': 'What\'s your favorite drink?',
      'answers' : [{'text':'Beer','score': 5}, {'text':'Wine', 'score': 3}, {'text':'Spritz', 'score' : 2}, {'text':'Hugo', 'score' : 1}],
    },
    {
      'questionText': 'What\'s your favorite drug?',
      'answers' : [{'text':'Weed', 'score':5}, {'text':'LSD', 'score': 3}, {'text':'Cocaine', 'score': 1}],
    },
    {
      'questionText': 'Who\'s the great smoker?',
      'answers' : [{'text':'Leo', 'score': 5}, {'text':'Franci', 'score': 10}, {'text':'Lore', 'score': 3}],
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {

    _totalScore += score;

    setState(() {
      _questionIndex= _questionIndex +1;
    });

    print(_questionIndex);
  }

  @override
  Widget build(BuildContext ctx) {

    return MaterialApp(home: Scaffold(
      appBar: AppBar(
        title: Text('Triumvirato ent.'),
      ),
      body: _questionIndex < _questions.length
          ? Quiz(_questions , _questionIndex, _answerQuestion)
          : Result(_totalScore, _resetQuiz)
    ),);
  }
}

