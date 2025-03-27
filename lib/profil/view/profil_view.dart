import 'package:emmeuhnez_moi_app/Accueil/widget/button_accueil.dart';
import 'package:emmeuhnez_moi_app/profil/view/connexion_view.dart';
import 'package:flutter/material.dart';

class ProfilView extends StatefulWidget {
  const ProfilView({super.key});

  @override
  State<ProfilView> createState() => ProfilViewState();
}

class ProfilViewState extends State<ProfilView>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    tabController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      title: Text('Profil', style: TextStyle(color: Colors.deepPurple)),
        bottom: TabBar(controller: tabController, tabs: [
          Tab(
              child: Text(
            'Informations',
            style: TextStyle(fontSize: 16),
          )),
          Tab(
              child: Text(
            'Paramètres',
            style: TextStyle(fontSize: 16),
          )),
        ]),
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          InformationPage(),
          ParametrePage(),
        ],
      ),
    );
  }
}

class InformationPage extends StatelessWidget {
  const InformationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
    );
  }
}

class ParametrePage extends StatelessWidget {
  const ParametrePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 300,
              child: ElevatedButton(
                onPressed: () {
                  // Action for first button
                },
                child: Text(
                    style: TextStyle(fontSize: 18),
                    'Modifier vos informations'),
              ),
            ),
            SizedBox(height: 10),
            SizedBox(
              width: 300,
              child: ElevatedButton(
                onPressed: () {
                  // Action for second button
                },
                child: Text(
                    style: TextStyle(fontSize: 18),
                    'Modifier votre mot de passe'),
              ),
            ),
            SizedBox(height: 10),
            SizedBox(
              width: 300,
              child: ElevatedButton(
                onPressed: () {
                  showDialog(context: context, builder: (BuildContext context){
                    return AlertDialog(
                      title: Text('Attention'),
                      content: Text(
                        style: TextStyle(fontSize: 16),
                        'Êtes-vous sûr(e) de vouloir vous déconnecter ?'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text(style: TextStyle(fontSize: 16),
                            'Annuler'),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  style: TextStyle(fontSize: 16),
                                  'Vous êtes déconnecté(e) !'),
                                duration: Duration(seconds: 2),
                            ));
                          },
                          child: Text(style: TextStyle(fontSize: 16),
                            'Confirmer'),
                        ),
                      ],
                    );
                  });
                },
                child: Text(
                    style: TextStyle(
                        fontSize: 18,
                        color: const Color.fromARGB(255, 250, 77, 77)),
                    'Se déconnecter'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

