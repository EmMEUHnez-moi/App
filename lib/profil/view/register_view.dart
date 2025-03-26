import 'package:flutter/material.dart';
import 'package:emmeuhnez_moi_app/trajets/widget/champforumlaire_picker.dart';
import 'package:emmeuhnez_moi_app/accueil/widget/button_accueil.dart';
import 'package:emmeuhnez_moi_app/main.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  _RegisterViewState createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordconfirmationController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool _areFieldsIdentical() {
    return _passwordconfirmationController.text == _passwordController.text;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Inscrivez-vous')),
        body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(children: <Widget>[
              ChampFormulaire(label: "Mail", texteduchamp: '', cacheoupas: false, controller: _emailController),
              ChampFormulaire(label: "Mot de passe", texteduchamp: '', cacheoupas: true, controller: _passwordController),
              ChampFormulaire(label: "Confirmation du mot de passe", texteduchamp: '', cacheoupas: true, controller: _passwordconfirmationController),
              Center(
                  child: CustomButton(
                label: "S'inscrire",
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false & _areFieldsIdentical()) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => RegisterSuiteView()));}
                },
              ))
            ])));
  }
}

class RegisterSuiteView extends StatefulWidget {
  const RegisterSuiteView({super.key});

  @override
  _RegisterSuiteViewState createState() => _RegisterSuiteViewState();
}

class _RegisterSuiteViewState extends State<RegisterSuiteView> {
  final TextEditingController _nomController = TextEditingController();
  final TextEditingController _prenomController = TextEditingController();
  final TextEditingController _datedenaissanceController = TextEditingController();
  final TextEditingController _numerodetelController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Inscription'),
        ),
        body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                ChampFormulaire(label: "Nom", texteduchamp: '', cacheoupas: false, controller: _nomController),
                ChampFormulaire(label: "Prénom", texteduchamp: '', cacheoupas: false, controller: _prenomController),
                ChampFormulaire(label: "Date de naissance", texteduchamp: 'JJ/MM/AAAA', cacheoupas: false, controller: _datedenaissanceController),
                ChampFormulaire(label: "Numéro de téléphone", texteduchamp: '', cacheoupas: false, controller: _numerodetelController),
                Center(
                    child: CustomButton(
                  label: "Terminer",
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MyHomePage()));}
                  },
                ))
              ],
            )));
  }
}
