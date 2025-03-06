import 'package:flutter/material.dart';
import 'package:emmeuhnez_moi_app/appcovoit.dart';


class ConnectPage extends StatelessWidget {
  const ConnectPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Connectez-vous'),
      ),
      body: Padding( padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[ Text('Identifiant ou mail')],),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  labelText: '',
                  border: OutlineInputBorder(),),),
            ),
            Row(
              children: <Widget>[ Text('Mot de passe')],),
            Expanded( //test du mot correct ou incorrect
              child: TextField(
              decoration: InputDecoration(
                labelText: '',
                border: OutlineInputBorder(),),),
            ),
            Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => InscripPage())
                  );
                },
                child: Text("Vous n'avez pas de compte, inscrivez-vous en cliquant ici")
              ),),
              Center(
                child: ElevatedButton( //mettre conditions et erreurs
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyHomePage()));
                  },
                  child: Text('Connecter')
                ) 
              )
          ]      
        )
        )
    );
  }
}

class InscripPage extends StatelessWidget {
  const InscripPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text('Inscrivez-vous')),
      body: Padding(padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[Text('Mail')],),
            Expanded(
               child: TextField(
                decoration: InputDecoration(
                  labelText: '',
                  border: OutlineInputBorder(),),),
            ),
            Row(
              children: <Widget>[Text('Mot de passe')],),
            Expanded(
               child: TextField(
                decoration: InputDecoration(
                  labelText: '',
                  border: OutlineInputBorder(),),),
            ),   
            Row(
              children: <Widget>[Text('Confirmation du mot de passe')],),
            Expanded( //condition à mettre !!
               child: TextField(
                decoration: InputDecoration(
                  labelText: '',
                  border: OutlineInputBorder(),),),
            ), 
            Center(
                child: ElevatedButton( //mettre conditions et erreurs
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => InscripSuitePage()));
                  },
                  child: Text("S'inscrire")
                ) 
              )
          ]
        )
      )
    );
}
}

class InscripSuitePage extends StatelessWidget {
  const InscripSuitePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Inscription'),), 
      body: Padding(padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[Text('Nom')],),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  labelText: '', 
                  border: OutlineInputBorder())),),
            Row(
              children: <Widget>[Text('Prénom')],),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  labelText: '', 
                  border: OutlineInputBorder())),),
            Row(
              children: <Widget>[Text('Date de naissance')],),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'JJ/MM/AAAA', 
                  border: OutlineInputBorder())),),
            Row(
              children: <Widget>[Text('Numéro de téléphone')],),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  labelText: '', 
                  border: OutlineInputBorder())),),
            Center(
                child: ElevatedButton( //mettre conditions et erreurs
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyHomePage()));
                  },
                  child: Text("Terminer")))
            ],)
      )
    );
  }
}
