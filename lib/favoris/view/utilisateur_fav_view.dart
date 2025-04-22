import 'package:emmeuhnez_moi_app/Accueil/widget/card.dart';
import 'package:flutter/material.dart';

class UtilisateurfavView extends StatefulWidget {
  const UtilisateurfavView({super.key});

  @override
  State<UtilisateurfavView> createState() => UtilisateurfavViewState();
}

class UtilisateurfavViewState extends State<UtilisateurfavView> {
  final listeUtilisateur = [
    {
      "Utilisateur": "Coumba Niakate",
      "Bat": "N",
      "Etat": "Passager"
    },
    {
      "Utilisateur": "Adrien Marly",
      "Bat": "P",
      "Etat": "Conducteur/Passager"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView.builder(
          itemCount: listeUtilisateur.length,
          itemBuilder: (context, index) {
            final listedescovoits = listeUtilisateur[index];
            /*final actions = [
              () => infoprofil(listedescovoits),
              () => ajoutOUsupprFavoris(listedescovoits),
            ];*/

            return UtilisateurCard(
              utilisateurDetails: listedescovoits, 
              /*actionLabel1: "Rechercher",
              actionLabel2: "Supprimer des favoris", 
              actions: actions*/
              );
          },
        ),
      ),
    );
  }
}
