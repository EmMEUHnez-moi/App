import 'package:flutter/material.dart';

class MessageView extends StatelessWidget {
  const MessageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'En cours...',
          style: TextStyle(
            fontSize: 24, // Taille de la police
            fontWeight: FontWeight.bold, // Police en gras
            color: Colors.deepPurple, // Couleur du texte
          ),
        ),
      ),
    );
  }
}
