import 'package:flutter/material.dart';

class NewTrajetFavorisView extends StatelessWidget {
  const NewTrajetFavorisView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      title: Text("Choix d'un trajet favoris",style: TextStyle(color: Colors.deepPurple)),
    ));
  }
}
