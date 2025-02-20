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
  const PageAccueil({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AjouterTrajetPage()));}, 
              child: Text("Ajouter un trajet")),
        actions: [IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfileScreen()));
          }, 
          icon: Icon(Icons.person, color: Colors.deepPurple))])
    );
  }
}

class PageFavoris extends StatelessWidget {
  const PageFavoris({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

class PageMessage extends StatelessWidget {
  const PageMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

class PageTrajets extends StatelessWidget {
  const PageTrajets({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}