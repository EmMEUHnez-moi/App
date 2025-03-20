import 'package:flutter/material.dart';

class ChampFormulaire extends StatelessWidget {
  final String label;
  final String texteduchamp;
  final TextEditingController? controller;

  const ChampFormulaire(
      {super.key,
      required this.label,
      required this.texteduchamp,
      this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Row(
        children: <Widget>[Text(label)],
      ),
      TextField(
        controller: controller,
        decoration: InputDecoration(
            labelText: texteduchamp, border: OutlineInputBorder()),
      )
    ]);
  }
}
