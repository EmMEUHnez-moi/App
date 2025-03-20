import 'package:flutter/material.dart';
import 'package:emmeuhnez_moi_app/accueil/widget/button_accueil.dart';
import 'package:emmeuhnez_moi_app/trajets/view/new_trajet_view.dart';
import 'package:emmeuhnez_moi_app/profil/view/profil_view.dart';

class AccueilView extends StatelessWidget {
  const AccueilView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(title: Text('Accueil'), actions: [
              IconButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ProfilView()));
                  },
                  icon: Icon(Icons.person, color: Colors.deepPurple))
            ]),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            floatingActionButton: CustomButton(
              label: "Ajouter un trajet",
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => NewTrajetView()));
              },
            )));
  }
}
