import 'package:emmeuhnez_moi_app/Accueil/widget/button_accueil.dart';
import 'package:emmeuhnez_moi_app/trajets/widget/champforumlaire_picker.dart';
import 'package:emmeuhnez_moi_app/profil/view/connexion_view.dart';
import 'package:emmeuhnez_moi_app/trajets/widget/dropdownlist.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:emmeuhnez_moi_app/trajets/widget/numero_telephone.dart';

class ProfilView extends StatefulWidget {
  const ProfilView({super.key});

  @override
  State<ProfilView> createState() => ProfilViewState();
}

class ProfilViewState extends State<ProfilView>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  final ValueNotifier<Map<String, String>> userInfo = ValueNotifier({
    'email': 'exemple@email.com',
    'phone': '06 00 00 00 00',
    'etat': 'Conducteur',
    'adresse': 'Adresse',
    'vehicule': 'modèle',
  });

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    tabController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    userInfo.dispose();
    super.dispose();
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
          InformationPage(userInfo: userInfo),
          ParametrePage(userInfo: userInfo),
        ],
      ),
    );
  }
}

class InformationPage extends StatelessWidget {
  final ValueNotifier<Map<String, String>> userInfo;

  const InformationPage({super.key, required this.userInfo});

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
              child: ValueListenableBuilder<Map<String, String>>(
                valueListenable: userInfo,
                builder: (context, value, child) {
                  return ListView(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      ListTile(
                          leading: Icon(Icons.email),
                          title: Text('Adresse email : ${value['email']}')),
                      ListTile(
                          leading: Icon(Icons.phone),
                          title: Text('Numéro de téléphone :\n${value['phone']}')),
                      ListTile(leading: Icon(Icons.man), title: Text('Etat : ${value['etat']}')),
                      ListTile(
                          leading: Icon(Icons.home), title: Text('Adresse : ${value['adresse']}')),
                      if (value['etat'] == 'Conducteur' ||
                          value['etat'] == 'Conducteur et passager') ...[
                        ListTile(
                          leading: Icon(Icons.airport_shuttle_rounded),
                          title: Text('Modèle du véhicule : ${value['vehicule']}'),
                        ),
                      ],
                      ListTile(
                          leading: Icon(Icons.check_rounded),
                          title: Text('Nombre de trajets effectués :'))
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ParametrePage extends StatelessWidget {
  final ValueNotifier<Map<String, String>> userInfo;

  const ParametrePage({super.key, required this.userInfo});
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
                    MaterialPageRoute(builder: (context) => ModifInfo(userInfo: userInfo,)),
                  ); // Action for first button
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
  final ValueNotifier<Map<String, String>> userInfo;
  const ModifInfo({super.key, required this.userInfo});

  @override
  _ModifInfoState createState() => _ModifInfoState();
}

class _ModifInfoState extends State<ModifInfo> {
  String? _selectedValue;
  bool _showVehiculeField = false;
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _adresseController = TextEditingController();
  final TextEditingController _vehiculeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Pré-remplir les champs avec les valeurs actuelles
    _phoneController.text = widget.userInfo.value['phone'] ?? '';
    _adresseController.text = widget.userInfo.value['adresse'] ?? '';
    _vehiculeController.text = widget.userInfo.value['vehicule'] ?? '';
    _selectedValue = widget.userInfo.value['etat'];
    _showVehiculeField = _selectedValue == 'Conducteur' || _selectedValue == 'Conducteur et passager';
  }
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
                controller: _phoneController,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(10),
                  PhoneNumberFormatter(),
                ],
              ),
              SizedBox(height: 20),
              ChampFormulaire(
                label: "Adresse",
                texteduchamp: '',
                cacheoupas: false,
                controller: _adresseController,
              ),
              SizedBox(height: 20),
              ListeDeroulante(
                label: "Etat",
                options: ['Conducteur', 'Passager', 'Conducteur et passager'],
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedValue = newValue;
                    _showVehiculeField = newValue == 'Conducteur' ||
                        newValue == 'Conducteur et passager';
                  });
                  // Action for dropdownlist
                },
              ),
              if (_showVehiculeField) ...[
                SizedBox(height: 20),
                ChampFormulaire(
                  label: "Modèle du véhicule",
                  texteduchamp: '',
                  cacheoupas: false,
                  controller: _vehiculeController,
                ),
                
              ], // Affiche le champ si l'état est conducteur

              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  widget.userInfo.value = {
                    'email': widget.userInfo.value['email'] ?? '',
                    'phone': _phoneController.text,
                    'etat': _selectedValue ?? '',
                    'adresse': _adresseController.text,
                    'vehicule': _vehiculeController.text,
                  };
                  widget.userInfo.notifyListeners(); // Notifier les changements
                  Navigator.pop(context);
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
