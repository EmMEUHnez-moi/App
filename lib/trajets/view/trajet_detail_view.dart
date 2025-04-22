import 'package:emmeuhnez_moi_app/trajets/cubit/book_trip_cubit.dart';
import 'package:emmeuhnez_moi_app/trajets/model/trip.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TrajetDetailsScreen extends StatelessWidget {
  final Trip trajet;

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
                backgroundImage: AssetImage("assets/images/profile.jpg"),
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
