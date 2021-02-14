import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetScore;

  Result(this.resultScore, this.resetScore);

  String get resultPhrase {
    String resultText;
    if (resultScore < 3) {
      resultText = 'あなたは、\n「理想は高く、独善的」\nなタイプです。';
    } else if (resultScore < 6) {
      resultText = 'あなたは、\n「気は優しくても、欲求不満」\nなタイプです。';
    } else {
      resultText = 'あなたは、\n「面倒見がいいが、妥協しない」\nタイプです。';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text(
        resultPhrase,
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
      ),
      RaisedButton(
        child: Text('戻る'),
        onPressed: (resetScore),
      )
    ]);
  }
}
