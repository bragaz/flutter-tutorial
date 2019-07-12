import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;

  final Function resetHandler;

  Result(this.resultScore, this.resetHandler);

  String get resultPhrase {
    var resultText = "420 Blaze it! You win ->";
    if (resultScore <= 10) {
      resultText += " a joint";
    } else if (resultScore <= 15) {
      resultText += " a blunt";
    } else {
      resultText += " a bong";
    }

    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Center(
          child: Text(resultPhrase,
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold))),
      FlatButton(child: Text('Restar TriumQuiz!'), textColor: Colors.green, onPressed: resetHandler,)
    ]);
  }
}
