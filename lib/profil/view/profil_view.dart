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
    return Scaffold();
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
