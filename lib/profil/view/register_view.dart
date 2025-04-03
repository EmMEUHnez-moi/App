import 'package:emmeuhnez_moi_app/profil/cubit/register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:emmeuhnez_moi_app/trajets/widget/champforumlaire_picker.dart';
import 'package:emmeuhnez_moi_app/accueil/widget/button_accueil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool _areFieldsIdentical() {
    return _confirmPasswordController.text == _passwordController.text;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Inscrivez-vous')),
        body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(children: <Widget>[
              ChampFormulaire(
                  label: "Mail",
                  texteduchamp: '',
                  cacheoupas: false,
                  controller: _emailController),
              ChampFormulaire(
                  label: "Mot de passe",
                  texteduchamp: '',
                  cacheoupas: true,
                  controller: _passwordController),
              ChampFormulaire(
                  label: "Confirmation du mot de passe",
                  texteduchamp: '',
                  cacheoupas: true,
                  controller: _confirmPasswordController),
              Center(
                  child: CustomButton(
                label: "S'inscrire",
                onPressed: () {
                  if (_formKey.currentState?.validate() ??
                      false & _areFieldsIdentical()) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RegisterSuiteView(
                                _emailController.text,
                                _passwordController.text)));
                  }
                },
              ))
            ])));
  }
}

class RegisterSuiteView extends StatefulWidget {
  final String email;
  final String password;
  const RegisterSuiteView(this.email, this.password, {super.key});

  @override
  State<RegisterSuiteView> createState() => _RegisterSuiteViewState();
}

class _RegisterSuiteViewState extends State<RegisterSuiteView> {
  _RegisterSuiteViewState();
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _dateOfBirthController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();

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
                ChampFormulaire(
                    label: "Nom",
                    texteduchamp: '',
                    cacheoupas: false,
                    controller: _surnameController),
                ChampFormulaire(
                    label: "Prénom",
                    texteduchamp: '',
                    cacheoupas: false,
                    controller: _nameController),
                ChampFormulaire(
                    label: "Date de naissance",
                    texteduchamp: 'JJ/MM/AAAA',
                    cacheoupas: false,
                    controller: _dateOfBirthController),
                ChampFormulaire(
                    label: "Numéro de téléphone",
                    texteduchamp: '',
                    cacheoupas: false,
                    controller: _phoneNumberController),
                BlocConsumer<RegisterBloc, RegisterState>(
                    listener: (context, state) {
                  if (state is RegisterSuccess) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Inscription réussie !")));
                  } else if (state is RegisterFailure) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Erreur : ${state.error}")));
                  }
                }, builder: (context, state) {
                  if (state is RegisterLoading) {
                    return CircularProgressIndicator();
                  }
                  return ElevatedButton(
                    onPressed: () {
                      final name = _nameController.text;
                      final surname = _surnameController.text;
                      final dateOfBirth = _dateOfBirthController.text;
                      final phoneNumber = _phoneNumberController.text;
                      context.read<RegisterBloc>().add(RegisterSubmitted(
                          email: widget.email,
                          password: widget.password,
                          name: name,
                          surname: surname,
                          dateOfBirth: dateOfBirth,
                          phoneNumber: phoneNumber));
                    },
                    child: Text("Connexion"),
                  );
                }),
              ],
            )));
  }
}
