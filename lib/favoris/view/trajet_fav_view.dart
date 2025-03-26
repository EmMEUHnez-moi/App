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
      "avatar": "volant",
    },
    {
      "Conducteur": "Adrien Marly",
      "Date": "12H00",
      "Lieu Départ": "Ecole",
      "Lieu arrivé": "MEUH Bat P",
      "avatar": "Siege",
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView.builder(
          itemCount: listeCovoit.length,
          itemBuilder: (context, index) {
            final listedescovoits = listeCovoit[index];
            final avatar = listedescovoits['avatar'];
            final conducteur = listedescovoits['Conducteur'];
            final date = listedescovoits['Date'];
            final lieudepart = listedescovoits['Lieu Départ'];
            final lieuarrive = listedescovoits['Lieu arrivé'];

            return Card(
              child: ListTile(
                leading: Image.asset("assets/images/$avatar.jpg"),
                title: Text(
                    'Trajet $lieudepart à $lieuarrive Conducteur : $conducteur',style: TextStyle(color: Colors.white)),
                subtitle: Text('1 Place $lieudepart à $date',style: TextStyle(color: Colors.white)),
                trailing: Icon(Icons.more_vert, color: Colors.white),
                tileColor: Colors.deepPurple[300],
              ),
            );
          },
        ),
      ),
    );
  }
}