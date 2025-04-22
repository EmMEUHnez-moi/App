import 'package:emmeuhnez_moi_app/trajets/cubit/search_trip_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TrajetsView extends StatefulWidget {
  const TrajetsView({super.key});

  @override
  State<TrajetsView> createState() => TrajetsViewState();
}

class TrajetsViewState extends State<TrajetsView> {

  @override
  Widget build(BuildContext context) {
    context.read<SearchBloc>().add(SearchMineTripSubmitted());
    return Scaffold(
      appBar: AppBar(
        title: Text('Mes Trajets', style: TextStyle(color: Colors.deepPurple)),
      ),
      body: Center(
          child: BlocConsumer<SearchBloc, SearchState>(
        listener: (context, state) {
          if (state is SearchMineTripNoResults) {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Aucun résultat trouvé")));
          }
        },
        builder: (context, state) {
          if (state is SearchMineTripSuccess) {
            return ListView.builder(
              itemCount: state.results.length,
              itemBuilder: (context, index) {
                final trip = state.results[index];
                return ListTile(
                  title: Text('${trip.fromLocation} → ${trip.toLocation}'),
                  subtitle: Text(
                      'Conducteur: ${trip.driver.name} → ${trip.driver.surname}- Départ: ${trip.startDate.day}/${trip.startDate.month}/${trip.startDate.year} ${trip.hourOfDeparture.hour.toString().padLeft(2, '0')}:${trip.hourOfDeparture.minute.toString().padLeft(2, '0')}'),
                  onTap: () {
                    //openTrajetDetails(context, trip);
                  },
                );
              },
            );
          } else if (state is SearchMineTripLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is SearchMineTripNoResults) {
            return const Center(child: Text("Aucun résultat trouvé"));
          } else if (state is SearchMineTripFailure) {
            return Center(child: Text("Erreur de connexion : ${state.error}"));
          } else {
            return const Center(
                child: Text("Commencer par rechercher un trajet"));
          }
        },
      )),
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
              'Conducteur: ${trajet["Conducteur"]} - Départ: ${trajet["Date"]}    Places disponibles: ${trajet["Nombre de places"]}'),
          onTap: () {
            //openTrajetDetails(context, trajet);
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
