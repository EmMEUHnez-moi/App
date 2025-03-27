import 'package:flutter/material.dart';
import 'package:emmeuhnez_moi_app/trajets/view/trajet_detail_view.dart';


class TrajetsView extends StatefulWidget {
  const TrajetsView({super.key});

  @override
  State<TrajetsView> createState() => TrajetsViewState();
}

class TrajetsViewState extends State<TrajetsView> {
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
    },
    {
      "Conducteur": "William Machecourt",
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
        actions:[
          IconButton(
            onPressed: () {
              showSearch(
              context: context,
              delegate: CustomSearchDelegate(listeCovoit),
              );
            },
          icon: const Icon(Icons.search),
          ),
        ]
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
              shape : RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              color : Colors.deepPurple[300],
              child: ListTile(
                leading: Image.asset("assets/images/$avatar.jpg"),
                title: Text('Trajet $lieudepart → $lieuarrive\nConducteur : $conducteur',style: TextStyle(color: Colors.white)),
                subtitle: Text('1 Place - Départ : $date',style: TextStyle(color: Colors.white)),
                trailing: PopupMenuButton<String>(
                  icon: const Icon(Icons.more_vert, color: Colors.white),
                  onSelected: (String value) {
                    if (value == 'Réserver') {
                      // Action pour réserver
                    } else if (value == 'Favoris') {
                      // Action pour ajouter aux favoris
                    }
                  },
                  itemBuilder: (BuildContext context) {
                    return [
                      const PopupMenuItem<String>(
                        value: 'Réserver',
                        child: Text('Réserver'),
                      ),
                      const PopupMenuItem<String>(
                        value: 'Favoris',
                        child: Text('Ajouter aux favoris'),
                      ),
                    ];
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}







class CustomSearchDelegate extends SearchDelegate {
  final List<Map<String, String>> trajets;

  CustomSearchDelegate(this.trajets);



  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<Map<String, String>> matchQuery = trajets.where((trajet) {
      return trajet.values.any((value) => value.toLowerCase().contains(query.toLowerCase()));
    }).toList();

    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var trajet = matchQuery[index];
        return ListTile(
         title: Text('${trajet["Lieu Départ"]} → ${trajet["Lieu arrivé"]}'),
          subtitle: Text('Conducteur: ${trajet["Conducteur"]} - Départ: ${trajet["Date"]}'),
          onTap: () {
            openTrajetDetails(context, trajet);
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return buildResults(context);
  }
}