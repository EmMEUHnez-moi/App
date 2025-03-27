import 'package:flutter/material.dart';
import 'package:emmeuhnez_moi_app/trajets/view/trajet_detail_view.dart';

// Fonctions actions de l'icon more dans Card
void reserverTrajet(Map<String, String> Details) {
  // mettre le trajet dans mes trajets + occupe une place dans la voiture (liste avec les noms des passagers)
}

void rechercherTrajet(Map<String, String> Details) {
  // recherche le trajet dans l'accueil (trajets récents)
}

void ajoutOUsupprFavoris(Map<String, String> Details) {
  // si trajet ou utilisateur déjà dans favoris alors supprimer des favoris sinon ajouter aux favoris
}

void annulerTrajet(Map<String, String> Details) {
  // supprimer le trajet de mes trajets + libère une place dans la voiture (suppression du nom dans la liste des passagers)
}

void infoprofil(Map<String, String> Details) {
  // donne les informations de l'utilisateur
}

class TrajetCard extends StatelessWidget {
  final Map<String, String> trajetDetails;
/*  final List<Function> actions;
  final String actionLabel1; 
  final String actionLabel2;*/

  const TrajetCard({
    super.key,
    required this.trajetDetails,
    /*required this.actions, 
    required this.actionLabel1, 
    required this.actionLabel2*/
  });

  @override
  Widget build(BuildContext context) {
    final avatar = trajetDetails['avatar']!;
    final conducteur = trajetDetails['Conducteur']!;
    final date = trajetDetails['Date']!;
    final lieudepart = trajetDetails['Lieu Départ']!;
    final lieuarrive = trajetDetails['Lieu arrivé']!;

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      color: Colors.deepPurple[300],
      child: ListTile(
        leading: Image.asset("assets/images/$avatar.jpg"),
        title: Text(
          'Trajet $lieudepart → $lieuarrive\nConducteur : $conducteur',
          style: TextStyle(color: Colors.white),
        ),
        subtitle: Text('1 Place - Départ : $date',
            style: TextStyle(color: Colors.white)),
        trailing:
            // mettre conditions si dans favoris coeur plein sinon coeur vide
            const Icon(Icons.favorite_border, color: Colors.white),
        onTap: () {
          openTrajetDetails(context, trajetDetails);
        },
        /* PopupMenuButton<String>(
          icon: const Icon(Icons.more_vert, color: Colors.white),
          onSelected: (String value) {
            if (value == actionLabel1) {
              actions[0];
            } else if (value == actionLabel2) {
              actions[1];
            }
          },
          itemBuilder: (BuildContext context) {
            return [
              PopupMenuItem<String>(
                value: actionLabel1,
                child: Text(actionLabel1),
              ),
              PopupMenuItem<String>(
                value: actionLabel2,
                child: Text(actionLabel2),
              ),
            ];
          },
        ), */
      ),
    );
  }
}

class UtilisateurCard extends StatelessWidget {
  final Map<String, String> utilisateurDetails;
  /*final List<Function> actions;
  final String actionLabel1; 
  final String actionLabel2;*/

  const UtilisateurCard({
    super.key,
    required this.utilisateurDetails,
    /*required this.actions, 
    required this.actionLabel1, 
    required this.actionLabel2*/
  });

  @override
  Widget build(BuildContext context) {
    final utilisateur = utilisateurDetails['Utilisateur'];
    final bat = utilisateurDetails['Bat'];
    final etat = utilisateurDetails['Etat'];

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      color: Colors.deepPurple[300],
      child: ListTile(
        leading: Icon(
          Icons.person,
          color: Colors.white,
        ),
        title: Text('Prénom Nom : $utilisateur',
            style: TextStyle(color: Colors.white)),
        subtitle: Text('Bat : $bat        Etat : $etat',
            style: TextStyle(color: Colors.white)),
        trailing: const Icon(Icons.favorite_border, color: Colors.white),

        /*PopupMenuButton<String>(
          icon: const Icon(Icons.more_vert, color: Colors.white),
          onSelected: (String value) {
            if (value == actionLabel1) {
              actions[0];
            } else if (value == actionLabel2) {
              actions[1];
            }
          },
          itemBuilder: (BuildContext context) {
            return [
              PopupMenuItem<String>(
                value: actionLabel1,
                child: Text(actionLabel1),
              ),
              PopupMenuItem<String>(
                value: actionLabel2,
                child: Text(actionLabel2),
              ),
            ];
          },
        ),*/
      ),
    );
  }
}
