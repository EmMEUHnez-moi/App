import 'package:emmeuhnez_moi_app/Accueil/widget/button_accueil.dart';
import 'package:emmeuhnez_moi_app/profil/view/connexion_view.dart';
import 'package:flutter/material.dart';

class ProfilView extends StatelessWidget {
  const ProfilView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text('Profil', style: TextStyle(color: Colors.deepPurple),),
        ),
      /*  body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: CustomButton(
            label: 'Déconnexion', 
            onPressed: () {
              Navigator.push(context,
                MaterialPageRoute(builder: (context) => ConnexionView()));
              },)
          */   // TEMPORAIRE : seulement pour les tests
    );
  }
}
