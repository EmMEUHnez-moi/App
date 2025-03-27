import 'package:flutter/material.dart';

class TrajetDetailsScreen extends StatelessWidget {
  final Map<String, String> trajet;

  const TrajetDetailsScreen({super.key, required this.trajet});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Détails du Trajet'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image du conducteur ou du trajet
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage("assets/images/${trajet["avatar"]}.jpg"),
              ),
            ),
            const SizedBox(height: 20),

            // Informations principales
            Text(
              '${trajet["Lieu Départ"]} → ${trajet["Lieu arrivé"]}',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text('Conducteur: ${trajet["Conducteur"]}', style: TextStyle(fontSize: 18)),
            Text('Date et Heure: ${trajet["Date"]}', style: TextStyle(fontSize: 16)),
            const SizedBox(height: 20),

            // Boutons d'action
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    // Ajouter l'action pour réserver
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Réservation en cours...")),
                    );
                  },
                  icon: Icon(Icons.event_seat),
                  label: Text("Réserver"),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    // Simuler un appel (remplacer par la vraie action plus tard)
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Appel du conducteur...")),
                    );
                  },
                  icon: Icon(Icons.phone),
                  label: Text("Appeler"),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Bouton retour
            Center(
              child: TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text("Retour"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

  void openTrajetDetails(BuildContext context, Map<String, String> trajet) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => TrajetDetailsScreen(trajet: trajet),
    ),
  );
}
