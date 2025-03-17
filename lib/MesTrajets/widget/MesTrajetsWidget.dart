import 'package:flutter/material.dart';
import 'package:emmeuhnez_moi_app/MesTrajets/view/mestrajets_view.dart';

// ignore: unused_element
class MesTrajetsScreenState extends State<MesTrajetsScreen> {
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
      appBar: AppBar(
        title: Text('Mes Trajets'),
      ),
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
                    'Trajet $lieudepart à $lieuarrive Conducteur : $conducteur'),
                subtitle: Text('1 Place $lieudepart à $date'),
                trailing: Icon(Icons.more_vert),
              ),
            );
          },
        ),
      ),
    );
  }
}
