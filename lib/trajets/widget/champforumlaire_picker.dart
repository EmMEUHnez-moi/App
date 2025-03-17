import 'package:flutter/material.dart';

class ChampFormulaire extends StatelessWidget {
  final String label;
  final String texteduchamp;

  const ChampFormulaire(
      {super.key, required this.label, required this.texteduchamp});

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Row(
        children: <Widget>[Text(label)],
      ),
      TextField(
        decoration: InputDecoration(
            labelText: texteduchamp, border: OutlineInputBorder()),
      )
    ]);
  }
}
