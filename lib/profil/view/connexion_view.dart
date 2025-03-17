import 'package:flutter/material.dart';
import 'package:emmeuhnez_moi_app/accueil/widget/button_accueil.dart';
import 'package:emmeuhnez_moi_app/trajets/widget/champforumlaire_picker.dart';
import 'package:emmeuhnez_moi_app/main.dart';
import 'package:emmeuhnez_moi_app/profil/view/register_view.dart';

class ConnexionView extends StatelessWidget {
  const ConnexionView({super.key});

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
                              builder: (context) => RegisterView()));
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
