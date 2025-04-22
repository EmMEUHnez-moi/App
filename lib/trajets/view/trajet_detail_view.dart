import 'package:emmeuhnez_moi_app/trajets/cubit/book_trip_cubit.dart';
import 'package:emmeuhnez_moi_app/trajets/model/trip.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class TrajetDetailsScreen extends StatelessWidget {
  final Trip trajet;

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
              '${trajet.fromLocation} → ${trajet.toLocation}',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text('Conducteur: ${trajet.driver.name} ${trajet.driver.surname}',
                style: TextStyle(fontSize: 18)),
            Text(
                'Date et Heure: ${trajet.startDate.day.toString().padLeft(2, '0')}/${trajet.startDate.month.toString().padLeft(2, '0')}/${trajet.startDate.year} ${trajet.hourOfDeparture.hour.toString().padLeft(2, '0')}:${trajet.hourOfDeparture.minute.toString().padLeft(2, '0')}',
                style: TextStyle(fontSize: 16)),
            const SizedBox(height: 20),

            // Boutons d'action
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                BlocConsumer<BookTripBloc, BookTripState>(
                  listener: (context, state) {
                    if (state is BookTripSuccess) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Trajet réservé avec succès!")),
                      );
                      Navigator.pop(context);
                    }
                  },
                  builder: (context, state) {
                    return ElevatedButton.icon(
                      onPressed: () async {
                        // Ajouter l'action pour réserver
                        context.read<BookTripBloc>().add(
                              BookTripSubmitted(tripId: trajet.id),
                            );
                      },
                      icon: Icon(Icons.check),
                      label: Text("Réserver"),
                    );
                  },
                ),
                /*// Si la place est réservée, afficher le bouton "Annuler", sinon afficher "Réserver"
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
                      ),*/
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

void openTrajetDetails(BuildContext context, Trip trajet) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => TrajetDetailsScreen(trajet: trajet),
    ),
  );
}
