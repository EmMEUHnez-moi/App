import 'package:flutter/material.dart';

class TrajetfavView extends StatefulWidget {
  const TrajetfavView({super.key});

  @override
  State<TrajetfavView> createState() => TrajetfavViewState();
}

class TrajetfavViewState extends State<TrajetfavView> {
  final listeCovoit = [
    {
      "Conducteur": "Coumba Niakate",
      "Date": "18h05",
      "Lieu Départ": "Ecole",
      "Lieu arrivé": "MEUH Bat N",
      "Nombre de places": "4",
      "avatar": "volant",
    },
    {
      "Conducteur": "Adrien Marly",
      "Date": "12H00",
      "Lieu Départ": "Ecole",
      "Lieu arrivé": "MEUH Bat P",
      "Nombre de places": "2",
      "avatar": "Siege",
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          /*child: ListView.builder(
          itemCount: listeCovoit.length,
          itemBuilder: (context, index) {
            final listedescovoits = listeCovoit[index];
            /*final actions = [
              () => rechercherTrajet(listedescovoits),
              () => ajoutOUsupprFavoris(listedescovoits),
            ];*/

            return TrajetCard(
              trajetDetails: listedescovoits, 
              /*actionLabel1: "Rechercher",
              actionLabel2: "Supprimer des favoris", 
              actions: actions*/
              );
          },
        ),*/
          ),
    );
  }
}
