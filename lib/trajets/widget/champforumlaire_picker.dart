import 'package:flutter/material.dart';

class ChampFormulaire extends StatelessWidget {
  final String label;
  final String texteduchamp;
  final bool cacheoupas;
  final TextEditingController controller;

  const ChampFormulaire(
      {super.key, required this.label, required this.texteduchamp, required this.cacheoupas, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Row(
        children: <Widget>[Text(label,style: TextStyle(color: Colors.deepPurple))],
      ),
      TextFormField(
        obscureText: cacheoupas,
        controller: controller, 
        decoration: InputDecoration(
            labelText: texteduchamp, border: OutlineInputBorder(),
            labelStyle: TextStyle(color : Colors.deepPurple)),
        validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Le champ ne peut pas être vide';  // Message d'erreur si le champ est vide.
        }
        return null; }
      )
    ]);
  }
}
