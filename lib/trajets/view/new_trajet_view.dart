import 'package:flutter/material.dart';
import 'package:emmeuhnez_moi_app/accueil/view/accueil_view.dart';
import 'package:emmeuhnez_moi_app/accueil/widget/button_accueil.dart';
import 'package:emmeuhnez_moi_app/trajets/widget/champforumlaire_picker.dart';
import 'package:emmeuhnez_moi_app/trajets/widget/dropdownbutton_priveoupublic.dart';
import 'package:emmeuhnez_moi_app/favoris/view/new_trajet_favoris_view.dart';

class NewTrajetView extends StatefulWidget {
  const NewTrajetView({super.key});

  @override
  _NewTrajetViewState createState() => _NewTrajetViewState();
}

class _NewTrajetViewState extends State<NewTrajetView> {
  final TextEditingController _departController = TextEditingController();
  final TextEditingController _destinationController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _horaireController = TextEditingController();
  final TextEditingController _placesdispoController = TextEditingController();
  final TextEditingController _lieurdvController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Ajouter un trajet",style: TextStyle(color: Colors.deepPurple)), actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => NewTrajetFavorisView()));
              },
              icon: Icon(Icons.favorite, color: Colors.deepPurple))
        ]),
        body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                ChampFormulaire(label: "Lieu de départ", texteduchamp: '',cacheoupas: false, controller: _departController),
                ChampFormulaire(label: "Destination", texteduchamp: '', cacheoupas: false, controller: _destinationController),
                ChampFormulaire(label: "Date de départ", texteduchamp: 'JJ/MM/AAAA', cacheoupas: false, controller: _dateController),
                ChampFormulaire(label: "Horaire de départ", texteduchamp: 'HH:MM', cacheoupas: false, controller: _horaireController),
                ChampFormulaire(label: "Places disponibles", texteduchamp: '', cacheoupas: false, controller: _placesdispoController),
                ChampFormulaire(label: "Lieu de RDV", texteduchamp: '', cacheoupas: false, controller: _lieurdvController),
                Center(
                  child: PriveouPublic(),
                ),
                Center(
                  child: CustomButton(
                    label: 'Ajouter',
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => AccueilView()));}
                    },
                  ),
                )
              ],
            )));
  }
}
