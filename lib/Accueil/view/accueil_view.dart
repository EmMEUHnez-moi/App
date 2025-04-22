import 'package:emmeuhnez_moi_app/Accueil/view/search_view.dart';
import 'package:emmeuhnez_moi_app/Accueil/widget/card.dart';
import 'package:emmeuhnez_moi_app/trajets/cubit/search_trip_cubit.dart';
import 'package:flutter/material.dart';
import 'package:emmeuhnez_moi_app/accueil/widget/button_accueil.dart';
import 'package:emmeuhnez_moi_app/trajets/view/new_trajet_view.dart';
import 'package:emmeuhnez_moi_app/profil/view/profil_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AccueilView extends StatefulWidget {
  const AccueilView({super.key});

  @override
  State<AccueilView> createState() => AccueilViewState();
}

class AccueilViewState extends State<AccueilView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:
              const Text('Accueil', style: TextStyle(color: Colors.deepPurple)),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SearchView(),
                  ),
                );
              },
              icon: const Icon(Icons.search, color: Colors.deepPurple),
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
            // from result of search create listview
            child: BlocBuilder<SearchBloc, SearchState>(
          builder: (context, state) {
            if (state is SearchQuerySuccess) {
              return ListView.builder(
                itemCount: state.results.length,
                itemBuilder: (context, index) {
                  final trip = state.results[index];
                  return TrajetCard(
                    trajetDetails: trip,
                  );
                },
              );
            } else if (state is SearchQueryLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is SearchQueryNoResults) {
              return const Center(child: Text("Aucun résultat trouvé"));
            } else {
              return const Center(
                  child: Text("Commencer par rechercher un trajet"));
            }
          },
        )));
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
      return trajet.values
          .any((value) => value.toLowerCase().contains(query.toLowerCase()));
    }).toList();

    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var trajet = matchQuery[index];
        return ListTile(
          title: Text('${trajet["Lieu Départ"]} → ${trajet["Lieu arrivé"]}'),
          subtitle: Text(
              'Conducteur: ${trajet["Conducteur"]} - Départ: ${trajet["Date"]}'),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return buildResults(context);
  }
}
