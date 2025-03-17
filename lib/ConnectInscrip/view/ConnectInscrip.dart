import 'package:emmeuhnez_moi_app/Accueil/widget/Waccueil.dart';
import 'package:emmeuhnez_moi_app/AjouterUnTrajet/widget/Wajoutertrajet.dart';
import 'package:emmeuhnez_moi_app/main.dart';
import 'package:flutter/material.dart';

class ConnectPage extends StatelessWidget {
  const ConnectPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Connectez-vous'),
        ),
        body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(children: <Widget>[
              ChampFormulaire(label: "Identifiant ou mail", texteduchamp: ''),
              ChampFormulaire(label: "Mot de passe", texteduchamp: ''),
              Center(
                child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => InscripPage()));
                    },
                    child: Text(
                        "Vous n'avez pas de compte, inscrivez-vous en cliquant ici")),
              ),
              Center(
                  child: CustomButton(
                label: '',
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MyHomePage()));
                },
              ))
            ])));
  }
}

class InscripPage extends StatelessWidget {
  const InscripPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Inscrivez-vous')),
        body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(children: <Widget>[
              ChampFormulaire(label: "Mail", texteduchamp: ''),
              ChampFormulaire(label: "Mot de passe", texteduchamp: ''),
              ChampFormulaire(
                  label: "Confirmation du mot de passe", texteduchamp: ''),
              Center(
                  child: CustomButton(
                label: "S'inscrire",
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => InscripSuitePage()));
                },
              ))
            ])));
  }
}

class InscripSuitePage extends StatelessWidget {
  const InscripSuitePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Inscription'),
        ),
        body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                ChampFormulaire(label: "Nom", texteduchamp: ''),
                ChampFormulaire(label: "Prénom", texteduchamp: ''),
                ChampFormulaire(
                    label: "Date de naissance", texteduchamp: 'JJ/MM/AAAA'),
                ChampFormulaire(label: "Numéro de téléphone", texteduchamp: ''),
                Center(
                    child: CustomButton(
                  label: "Terminer",
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MyHomePage()));
                  },
                ))
              ],
            )));
  }
}
