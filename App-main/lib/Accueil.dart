import 'Profil.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
              MaterialPageRoute(builder: (context) => ProfilScreen()));
          }, 
          icon: Icon(Icons.person, color: Colors.deepPurple))])
    );
  }
}

class AjouterTrajetPage extends StatelessWidget {
  const AjouterTrajetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ajouter un trajet"),
        actions: [IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ChoixtrajetfavPage()));
          }, 
          icon: Icon(Icons.favorite, color: Colors.deepPurple))]),
      body: Padding(padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[Text("Lieu de départ")],),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  labelText: '', 
                  border: OutlineInputBorder()),)),
            Row(
              children: <Widget>[Text("Destination")],),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  labelText: '', 
                  border: OutlineInputBorder()),)),
            Row(
              children: <Widget>[Text("Date de départ")],),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'JJ/MM/AAAA', 
                  border: OutlineInputBorder()),)),
            Row(
              children: <Widget>[Text("Horaire de départ")],),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'HH:MM', 
                  border: OutlineInputBorder()),)),
            Row(
              children: <Widget>[Text("Places disponibles")],),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  labelText: '', 
                  border: OutlineInputBorder()),)),
            Row(
              children: <Widget>[Text("Lieu de RDV")],),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  labelText: '', 
                  border: OutlineInputBorder()),)),
            Center(child: PriveouPublic(),),
            Center(
                child: ElevatedButton( //mettre conditions et erreurs et consequences
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomeScreen()));
                  },
                  child: Text('Ajouter')
                ) 
              )
          ],))
    );
  }
}

class ChoixtrajetfavPage extends StatelessWidget {
  const ChoixtrajetfavPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Choix d'un trajet favoris"),
      )
    );
  }
}

class PriveouPublic extends StatefulWidget {
  const PriveouPublic({super.key});

  @override
  _ListederoulanteState createState() => _ListederoulanteState();
}

class _ListederoulanteState extends State<PriveouPublic> {
  String? _valeurchoisi = 'Public'; 
  final List<String> _options = ['Public','Privé'];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [DropdownButton<String>(
        value: _valeurchoisi,
        onChanged: (String? nouvvaleur) {
          setState(() {
            _valeurchoisi = nouvvaleur;
          });
        },
        items: _options.map<DropdownMenuItem<String>>((String valeur) {
          return DropdownMenuItem<String>(
            value: valeur, 
            child: Text(valeur),);}).toList(),),
      SizedBox(height: 20),]);
  }
}



