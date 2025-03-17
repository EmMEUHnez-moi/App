import 'package:emmeuhnez_moi_app/Accueil/widget/button_accueil.dart';
import 'package:emmeuhnez_moi_app/AjouterUnTrajet/view/ajoutertrajet_view.dart';
import 'package:emmeuhnez_moi_app/MonProfil/view/profil_view.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: PageAccueil());
  }
}

class PageAccueil extends StatelessWidget {
  const PageAccueil({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: CustomButton(
                label: "Ajouter un trajet",
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AjouterTrajetPage()));
                }),
            actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProfilScreen()));
              },
              icon: Icon(Icons.person, color: Colors.deepPurple))
        ]));
  }
}
