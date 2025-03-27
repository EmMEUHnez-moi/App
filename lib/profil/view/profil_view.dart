import 'package:emmeuhnez_moi_app/Accueil/widget/button_accueil.dart';
import 'package:emmeuhnez_moi_app/trajets/widget/champforumlaire_picker.dart';
import 'package:emmeuhnez_moi_app/profil/view/connexion_view.dart';
import 'package:emmeuhnez_moi_app/trajets/widget/dropdownlist.dart';  
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
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 20), //j'espace le texte des boutons
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
                width: 350,
                height: 380,
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
                          leading: Icon(Icons.home), title: Text('Adresse :')),
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ModifInfo()),
                  );  // Action for first button
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
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
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
                              child: Text(
                                  style: TextStyle(fontSize: 16), 'Annuler'),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                                Navigator.push(
                                  //temporaire, apres pushAndRemoveUntil
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ConnexionView()),
                                );
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: Text(
                                      style: TextStyle(fontSize: 16),
                                      'Vous êtes déconnecté(e) !'),
                                  duration: Duration(seconds: 2),
                                ));
                              },
                              child: Text(
                                  style: TextStyle(fontSize: 16), 'Confirmer'),
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

class ModifInfo extends StatefulWidget {
  const ModifInfo({super.key});

  @override
  _ModifInfoState createState() => _ModifInfoState();
}

class _ModifInfoState extends State<ModifInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Modifier vos informations'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: Column(
            children: <Widget>[
              ChampFormulaire(
                label: "Numéro de téléphone",
                texteduchamp: '',
                cacheoupas: false,
              ),
              SizedBox(height: 20),
              ListeDeroulante(
                label: "Etat",
                options: ['Conducteur', 'Passager', 'Conducteur et passager'],
                onChanged: (String? newValue) {
                  // Action for dropdownlist
                },
              ),
              SizedBox(height: 20),
              ChampFormulaire(
                label: "Adresse",
                texteduchamp: '',
                cacheoupas: false,
              ),
              SizedBox(height: 20),
              ChampFormulaire(
                label: "Modèle du véhicule",
                texteduchamp: '',
                cacheoupas: false,
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  // Action for button
                },
                child: Text('Valider'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
