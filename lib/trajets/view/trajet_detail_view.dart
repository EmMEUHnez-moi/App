import 'package:flutter/material.dart';

class TrajetDetailsScreen extends StatefulWidget {
  final Map<String, String> trajet;

  const TrajetDetailsScreen({super.key, required this.trajet});

  @override
  _TrajetDetailsScreenState createState() => _TrajetDetailsScreenState();
}

class _TrajetDetailsScreenState extends State<TrajetDetailsScreen> {
  late int placesDisponibles;
  bool isReserved = false;  // Variable pour savoir si la place a été réservée ou non

  @override
  void initState() {
    super.initState();
    // Initialiser placesDisponibles à partir de la donnée "Nombre de places" dans le trajet
    placesDisponibles = int.tryParse(widget.trajet["Nombre de places"] ?? '0') ?? 0;
  }

  // Fonction pour réserver une place
  void reserverPlace() {
    if (placesDisponibles > 0) {
      setState(() {
        placesDisponibles--;  // Décrémenter le nombre de places disponibles
        isReserved = true;  // Marquer la place comme réservée
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Réservation réussie! Places restantes: $placesDisponibles")),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Désolé, aucune place disponible.")),
      );
    }
  }

  // Fonction pour annuler une réservation
  void annulerReservation() {
    setState(() {
      placesDisponibles++;  // Augmenter le nombre de places disponibles
      isReserved = false;  // Marquer la place comme non réservée
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Réservation annulée! Places restantes: $placesDisponibles")),
    );
  }

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
                backgroundImage: AssetImage("assets/images/${widget.trajet["avatar"]}.jpg"),
              ),
            ),
            const SizedBox(height: 20),

            // Informations principales
            Text(
              '${widget.trajet["Lieu Départ"]} → ${widget.trajet["Lieu arrivé"]}',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text('Conducteur: ${widget.trajet["Conducteur"]}', style: TextStyle(fontSize: 18)),
            Text('Date et Heure: ${widget.trajet["Date"]}', style: TextStyle(fontSize: 16)),
            Text('Places disponibles: $placesDisponibles', style: TextStyle(fontSize: 16)),
            const SizedBox(height: 20),

            // Boutons d'action
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Si la place est réservée, afficher le bouton "Annuler", sinon afficher "Réserver"
                isReserved
                    ? ElevatedButton.icon(
                        onPressed: annulerReservation,  // Appeler la fonction pour annuler la réservation
                        icon: Icon(Icons.cancel),
                        label: Text("Annuler"),
                      )
                    : ElevatedButton.icon(
                        onPressed: reserverPlace,  // Appel de la fonction pour réserver une place
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
