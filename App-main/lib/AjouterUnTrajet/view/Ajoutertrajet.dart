import 'package:emmeuhnez_moi_app/Accueil/view/Accueil.dart';
import 'package:emmeuhnez_moi_app/Accueil/widget/Waccueil.dart';
import 'package:emmeuhnez_moi_app/AjouterUnTrajet/widget/Wajoutertrajet.dart';
import 'package:emmeuhnez_moi_app/ChoixTrajetFav/view/Choixtrajetfav.dart';
import 'package:flutter/material.dart';

class AjouterTrajetPage extends StatelessWidget {
  const AjouterTrajetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ajouter un trajet"),
        actions: [IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ChoixtrajetfavPage()));
          }, 
          icon: Icon(Icons.favorite, color: Colors.deepPurple))]),
      body: Padding(padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            ChampFormulaire(label: "Lieu de départ",texteduchamp: ''),
            ChampFormulaire(label: "Destination",texteduchamp: ''),
            ChampFormulaire(label: "Date de départ",texteduchamp: 'JJ/MM/AAAA'),
            ChampFormulaire(label: "Horaire de départ",texteduchamp: 'HH:MM'),
            ChampFormulaire(label: "Places disponibles",texteduchamp: ''),
            ChampFormulaire(label: "Lieu de RDV",texteduchamp: ''),
            Center(child: PriveouPublic(),),
            Center(
                child: CustomButton(
                  label: 'Ajouter', 
                  onPressed: () { Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()));
                  },),)
          ],))
    );
  }
}