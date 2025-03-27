import 'package:emmeuhnez_moi_app/Accueil/widget/card.dart';
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
        title: Text('Mes Trajets',style: TextStyle(color: Colors.deepPurple)),
        actions:[
          IconButton(
            onPressed: () {
              showSearch(
              context: context,
              delegate: CustomSearchDelegate(listeCovoit),
              );
            },
          icon: const Icon(Icons.search, color: Colors.deepPurple),
          ),
        ]
      ),
      body: Center(
        child: ListView.builder(
          itemCount: listeCovoit.length,
          itemBuilder: (context, index) {
            final listedescovoits = listeCovoit[index];
            /*final actions = [
              () => annulerTrajet(listedescovoits),
              () => ajoutOUsupprFavoris(listedescovoits),
            ];*/

            return TrajetCard(
              trajetDetails: listedescovoits, 
              /*actionLabel1: "Annuler",
              actionLabel2: "Ajouter/Supprimer aux favoris", // condition ajout ou suppr des favoris
              actions: actions*/);
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