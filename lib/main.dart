import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': '正しいと思ったら自分の考えを押し通すほうだ。',
      'answers': [
        {'text': 'かなり、あてはまる', 'score': 3},
        {'text': 'やや、あてはまる', 'score': 2},
        {'text': 'あまり、あてはまらない', 'score': 1},
        {'text': '全く、あてはまらない', 'score': 0},
      ]
    },
    {
      'questionText': '他人のミスに対しては寛大なほうだ。',
      'answers': [
        {'text': 'かなり、あてはまる', 'score': 3},
        {'text': 'やや、あてはまる', 'score': 2},
        {'text': 'あまり、あてはまらない', 'score': 1},
        {'text': '全く、あてはまらない', 'score': 0},
      ]
    },
    {
      'questionText': '何事も結果を予想してから行動に出るようにしている。',
      'answers': [
        {'text': 'かなり、あてはまる', 'score': 3},
        {'text': 'やや、あてはまる', 'score': 2},
        {'text': 'あまり、あてはまらない', 'score': 1},
        {'text': '全く、あてはまらない', 'score': 0},
      ]
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _answerQuestion(int score) {
    _totalScore += score;
    print('total score is ');
    print(_totalScore);
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
  }

  void _resetScore() {
    setState(() {
      _questionIndex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('心理テスト'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questions: _questions,
                questionIndex: _questionIndex)
            : Result(_totalScore, _resetScore),
      ),
    );
  }
}
