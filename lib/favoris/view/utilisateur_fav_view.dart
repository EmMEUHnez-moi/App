import 'package:flutter/material.dart';

class UtilisateurfavView extends StatefulWidget {
  const UtilisateurfavView({super.key});

  @override
  State<UtilisateurfavView> createState() => UtilisateurfavViewState();
}

class UtilisateurfavViewState extends State<UtilisateurfavView> {
  final listeUtilisateur = [
    {
      "Utilisateur": "Coumba Niakate",
      "Bat": "N",
      "Etat": "Passager"
    },
    {
      "Utilisateur": "Adrien Marly",
      "Bat": "P",
      "Etat": "Conducteur/Passager"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView.builder(
          itemCount: listeUtilisateur.length,
          itemBuilder: (context, index) {
            final listedesutilisateurs = listeUtilisateur[index];
            final utilisateur = listedesutilisateurs['Utilisateur'];
            final bat = listedesutilisateurs['Bat'];
            final etat = listedesutilisateurs['Etat'];

            return Card(
              child: ListTile(
                leading: Icon(Icons.person, color: Colors.white,),
                title: Text(
                    'Prénom Nom : $utilisateur',style: TextStyle(color: Colors.white)),
                subtitle: Text('Bat : $bat        Etat : $etat',style: TextStyle(color: Colors.white)),
                trailing: Icon(Icons.more_vert, color: Colors.white),
                tileColor: Colors.deepPurple[300],
              ),
            );
          },
        ),
      ),
    );
  }
}
