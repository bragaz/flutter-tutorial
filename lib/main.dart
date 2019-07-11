import 'package:flutter/material.dart';

import 'quiz.dart';
import 'result.dart';

void main() => runApp(MyApp());

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
      'answers' : [{'text':'Beer','score': 10}, {'text':'Wine', 'score': 7}, {'text':'Spritz', 'score' : 5}, {'text':'Hugo', 'score' : 3}],
    },
    {
      'questionText': 'What\'s your favorite drug?',
      'answers' : [{'text':'Weed', 'score':10}, {'text':'LSD', 'score': 7}, {'text':'Cocaine', 'score': 3}],
    },
    {
      'questionText': 'Who\'s the great smoker?',
      'answers' : [{'text':'Leo', 'score': 5}, {'text':'Franci', 'score': 10}, {'text':'Lore', 'score': 3}],
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

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
          : Result()
    ),);
  }
}

