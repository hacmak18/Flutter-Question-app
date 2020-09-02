import './result.dart';
import 'package:flutter/material.dart';
import './quiz.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;

  final _questions = const[
    {
      'questionText': 'what is your favorite color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 6},
        {'text': 'White', 'score': 3},
        {'text': 'Blue', 'score': 1},
      ]
    },
    {
      'questionText': 'what is your favorite animal?',
      'answers': [
        {'text': 'Dog', 'score': 1},
        {'text': 'Cat', 'score': 6},
        {'text': 'Snake', 'score': 3},
        {'text': 'Rabbit', 'score': 10},
      ]
    },
    {
      'questionText': 'Who\'s your Besfriend',
      'answers': [
        {'text': 'Mak', 'score': 5},
        {'text': 'Mayur', 'score': 4},
        {'text': 'Hacmak', 'score': 8},
        {'text': 'CM', 'score': 3},
      ]
    },
  ];

  var _totalScore=0;

  void _resetQuize(){
    setState(() {
      _questionIndex=0;
      _totalScore =0;
    });
  }

  void _answerQuestion(int score) {

    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });

    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('First App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore,_resetQuize),
      ),
    );
  }
}
