import 'package:flutter/material.dart';
import 'package:emmeuhnez_moi_app/accueil/widget/button_accueil.dart';
import 'package:emmeuhnez_moi_app/trajets/view/new_trajet_view.dart';
import 'package:emmeuhnez_moi_app/profil/view/profil_view.dart';





class AccueilView extends StatefulWidget {
  const AccueilView({super.key});

  @override
  State<AccueilView> createState() => AccueilViewState();
}

class AccueilViewState extends State<AccueilView> {
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
        title: const Text('Accueil'),
        actions: [
          IconButton(
            onPressed: () {
              showSearch(
                context: context,
                delegate: CustomSearchDelegate(listeCovoit),
              );
            },
            icon: const Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilView()),
              );
            },
            icon: const Icon(Icons.person, color: Colors.deepPurple),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CustomButton(
        label: "Ajouter un trajet",
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => NewTrajetView()),
          );
        },
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
                title: Text('Trajet $lieudepart → $lieuarrive\nConducteur : $conducteur'),
                subtitle: Text('1 Place - Départ : $date'),
                trailing: const Icon(Icons.more_vert),
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
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return buildResults(context);
  }
}