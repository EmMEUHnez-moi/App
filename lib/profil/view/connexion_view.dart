import 'package:flutter/material.dart';
import 'package:emmeuhnez_moi_app/accueil/widget/button_accueil.dart';
import 'package:emmeuhnez_moi_app/trajets/widget/champforumlaire_picker.dart';
import 'package:emmeuhnez_moi_app/main.dart';
import 'package:emmeuhnez_moi_app/profil/view/register_view.dart';

class ConnexionView extends StatefulWidget {
  const ConnexionView({super.key});

  @override
  _ConnexionViewState createState() => _ConnexionViewState();
}

class _ConnexionViewState extends State<ConnexionView> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Connectez-vous'),
        ),
        body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(children: <Widget>[
                ChampFormulaire(label: "Identifiant ou mail", texteduchamp: '', cacheoupas: false, controller: _emailController),
                ChampFormulaire(label: "Mot de passe", texteduchamp: '', cacheoupas: true, controller: _passwordController),
                Center(
                  child: GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                          MaterialPageRoute(builder: (context) => RegisterView()));
                    },
                    child: Text(
                        "Vous n'avez pas de compte, inscrivez-vous en cliquant ici")),
              ),
              Center(
                  child: CustomButton(
                label: 'Connexion',
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MyHomePage()));}
                },
              ))
            ]))));
  }
}
