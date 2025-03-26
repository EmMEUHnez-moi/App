import 'package:emmeuhnez_moi_app/Accueil/widget/button_accueil.dart';
import 'package:emmeuhnez_moi_app/profil/view/connexion_view.dart';
import 'package:flutter/material.dart';

class ProfilView extends StatelessWidget {
  const ProfilView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil', style: TextStyle(color: Colors.deepPurple)),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Spacer(),
                Container(
                  width: 340,
                  height: 90,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    image: DecorationImage(
                      image: AssetImage('assets/images/fleur.jpg'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Spacer(),
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage('assets/images/profile.jpg'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Spacer(),
                Container(
                  width: 340,
                  height: 90,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    image: DecorationImage(
                      image: AssetImage('assets/images/fleur.jpg'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Spacer(),
              ],
            ),
            Text(
              "Nom\nPrénom",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
                // fontFamily: 'PlaywriteHU',
              ),
            ),
            SizedBox(height: 20), //j'espace le texte des boutons
            Container(
                width: 400,
                height: 320,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.deepPurple,
                    width: 3,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListView(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      ListTile(
                          leading: Icon(Icons.email),
                          title: Text('Adresse email :')),
                      ListTile(
                          leading: Icon(Icons.phone),
                          title: Text('Numéro de téléphone :')),
                      ListTile(leading: Icon(Icons.man), title: Text('Etat :')),
                      ListTile(
                          leading: Icon(Icons.home), title: Text('Bâtiment :')),
                      ListTile(
                          leading: Icon(Icons.airport_shuttle_rounded),
                          title: Text('Modèle du véhicule :')),
                      ListTile(
                          leading: Icon(Icons.check_rounded),
                          title: Text('Nombre de trajets effectués :'))
                    ]))
          ],
        ),
      ),
      /*  body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: CustomButton(
            label: 'Déconnexion', 
            onPressed: () {
              Navigator.push(context,
                MaterialPageRoute(builder: (context) => ConnexionView()));
              },)
          */   // TEMPORAIRE : seulement pour les tests
    );
  }
}
