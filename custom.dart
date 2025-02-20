import 'package:emmeuhnez_moi_app/appcovoit.dart';
import 'package:flutter/material.dart';

class PremierePage extends StatefulWidget {
  const PremierePage({super.key});

  @override
  State<PremierePage> createState() => _PremierePageState();
}

class _PremierePageState extends State<PremierePage> {
  int _currentIndex = 0;
  final List<Widget> _connectorinscrip = [ConnectPage(), InscripPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _connectorinscrip[_currentIndex],);
  }
}

class PageAccueil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Acceuil", style: TextStyle(color: Colors.deepPurple)),
        actions: [IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfileScreen()));
          }, 
          icon: Icon(Icons.person, color: Colors.deepPurple))]),
      
    );
  }
}

