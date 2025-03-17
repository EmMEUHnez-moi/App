import 'package:flutter/material.dart';
import 'package:emmeuhnez_moi_app/trajets/widget/champforumlaire_picker.dart';
import 'package:emmeuhnez_moi_app/accueil/widget/button_accueil.dart';
import 'package:emmeuhnez_moi_app/main.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

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
                          builder: (context) => RegisterSuiteView()));
                },
              ))
            ])));
  }
}

class RegisterSuiteView extends StatelessWidget {
  const RegisterSuiteView({super.key});

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
