import 'package:flutter/material.dart';
import 'package:emmeuhnez_moi_app/accueil/view/accueil_view.dart';
import 'package:emmeuhnez_moi_app/accueil/widget/button_accueil.dart';
import 'package:emmeuhnez_moi_app/trajets/widget/champforumlaire_picker.dart';
import 'package:emmeuhnez_moi_app/trajets/widget/dropdownbutton_priveoupublic.dart';
import 'package:emmeuhnez_moi_app/favoris/view/new_trajet_favoris_view.dart';

class NewTrajetView extends StatelessWidget {
  const NewTrajetView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Ajouter un trajet"), actions: [
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
                ChampFormulaire(label: "Lieu de départ", texteduchamp: ''),
                ChampFormulaire(label: "Destination", texteduchamp: ''),
                ChampFormulaire(
                    label: "Date de départ", texteduchamp: 'JJ/MM/AAAA'),
                ChampFormulaire(
                    label: "Horaire de départ", texteduchamp: 'HH:MM'),
                ChampFormulaire(label: "Places disponibles", texteduchamp: ''),
                ChampFormulaire(label: "Lieu de RDV", texteduchamp: ''),
                Center(
                  child: PriveouPublic(),
                ),
                Center(
                  child: CustomButton(
                    label: 'Ajouter',
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AccueilView()));
                    },
                  ),
                )
              ],
            )));
  }
}
