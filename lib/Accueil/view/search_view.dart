import 'package:emmeuhnez_moi_app/trajets/cubit/search_trip_cubit.dart';
import 'package:emmeuhnez_moi_app/trajets/widget/champforumlaire_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final TextEditingController _fromLocationController = TextEditingController();
  final TextEditingController _toLocationController = TextEditingController();
  final TextEditingController _hourOfDepartureController =
      TextEditingController();
  final TextEditingController _userController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recherche'),
        foregroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            ChampFormulaire(
              label: "Lieu de départ",
              texteduchamp: '',
              cacheoupas: false,
              controller: _fromLocationController,
            ),
            ChampFormulaire(
              label: "Lieu d'arrivée",
              texteduchamp: '',
              cacheoupas: false,
              controller: _toLocationController,
            ),
            ChampFormulaire(
              label: "Heure",
              texteduchamp: '',
              cacheoupas: false,
              controller: _hourOfDepartureController,
            ),
            ChampFormulaire(
              label: "Utilisateur",
              texteduchamp: '',
              cacheoupas: false,
              controller: _userController,
            ),
            BlocConsumer<SearchBloc, SearchState>(
              listener: (context, state) {
                if (state is SearchQueryNoResults) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Aucun résultat trouvé")));
                }
              },
              builder: (context, state) {
                return ElevatedButton(
                  onPressed: () {
                    final fromLocation = _fromLocationController.text;
                    final toLocation = _toLocationController.text;
                    final hourOfDeparture = _hourOfDepartureController.text;
                    final user = _userController.text;

                    if (fromLocation.isEmpty &&
                        toLocation.isEmpty &&
                        hourOfDeparture.isEmpty &&
                        user.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("Veuillez remplir au moins un champ")));
                      return;
                    }

                    BlocProvider.of<SearchBloc>(context).add(
                      SearchQuerySubmitted(
                        fromLocation,
                        toLocation,
                        hourOfDeparture == ''
                            ? TimeOfDay(hour: 00, minute: 00)
                            : TimeOfDay(
                                hour: int.parse(hourOfDeparture.split(':')[0]),
                                minute:
                                    int.parse(hourOfDeparture.split(':')[1])),
                        user,
                      ),
                    );
                    Navigator.pop(context);
                  },
                  child: const Text('Rechercher'),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
