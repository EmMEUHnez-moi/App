import 'package:emmeuhnez_moi_app/trajets/model/trip.dart';
import 'package:flutter/material.dart';
import 'package:emmeuhnez_moi_app/trajets/view/trajet_detail_view.dart';
import 'package:flutter/material.dart';

// Fonctions actions de l'icon more dans Card
void reserverTrajet(Trip details) {
  // mettre le trajet dans mes trajets + occupe une place dans la voiture (liste avec les noms des passagers)
}

void rechercherTrajet(Trip details) {
  // recherche le trajet dans l'accueil (trajets récents)
}

void ajoutOUsupprFavoris(Trip details) {
  // si trajet ou utilisateur déjà dans favoris alors supprimer des favoris sinon ajouter aux favoris
}

void annulerTrajet(Trip details) {
  // supprimer le trajet de mes trajets + libère une place dans la voiture (suppression du nom dans la liste des passagers)
}

void infoprofil(Trip details) {
  // donne les informations de l'utilisateur
}

class TrajetCard extends StatelessWidget {
  final Trip trajetDetails;
/*  final List<Function> actions;
  final String actionLabel1; 
  final String actionLabel2;*/

  TrajetCard({
    super.key,
    required this.trajetDetails,
    /*required this.actions, 
    required this.actionLabel1, 
    required this.actionLabel2*/
  });

  @override
  Widget build(BuildContext context) {
    final fromLocation = trajetDetails.fromLocation;
    final toLocation = trajetDetails.toLocation;
    final hourOfDeparture =
        "${trajetDetails.hourOfDeparture.hour.toString().padLeft(2, '0')}:${trajetDetails.hourOfDeparture.minute.toString().padLeft(2, '0')}";
    final conducteur =
        "${trajetDetails.driver.name} ${trajetDetails.driver.surname}";
    final numberOfSeats = trajetDetails.numberOfSeats;
    final ValueNotifier<bool> isFavorited = ValueNotifier(false);

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      color: Colors.deepPurple[300],
      child: ListTile(
        leading: Image.asset("assets/images/profile.jpg"),
        title: Text(
          'Trajet $fromLocation → $toLocation\nConducteur : $conducteur',
          style: TextStyle(color: Colors.white),
        ),
        subtitle: Text('$numberOfSeats Place - Départ : $hourOfDeparture',
            style: TextStyle(color: Colors.white)),
        trailing:
            // mettre conditions si dans favoris coeur plein sinon coeur vide
            //const Icon(Icons.more, color: Colors.white),
            ValueListenableBuilder<bool>(
          valueListenable:
              isFavorited, // On écoute les changements de la valeur
          builder: (context, isFavorited, child) {
            return IconButton(
              icon: Icon(
                isFavorited ? Icons.favorite : Icons.favorite_border,
                color: Colors.white,
                size: 30,
              ),
              onPressed: () {
                ajoutOUsupprFavoris(trajetDetails);
                // Inverser l'état du favori
                isFavorited = !isFavorited;
                // Afficher un message via SnackBar
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                      content: Text(isFavorited
                          ? 'Ajouté aux favoris !'
                          : 'Retiré des favoris !')),
                );
                // Actualiser la valeur dans ValueNotifier
                isFavorited = isFavorited;
              },
            );
          },
        ),
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
