import 'package:emmeuhnez_moi_app/profil/cubit/register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:emmeuhnez_moi_app/trajets/widget/champforumlaire_picker.dart';
import 'package:emmeuhnez_moi_app/accueil/widget/button_accueil.dart';
import 'package:emmeuhnez_moi_app/main.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterView extends StatelessWidget {
  RegisterView({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
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
                  controller: _emailController),
              ChampFormulaire(
                  label: "Mot de passe",
                  texteduchamp: '',
                  controller: _passwordController),
              ChampFormulaire(
                  label: "Confirmation du mot de passe",
                  texteduchamp: '',
                  controller: _confirmPasswordController),
              Center(
                  child: CustomButton(
                label: "S'inscrire",
                onPressed: () {
                  final email = _emailController.text;
                  final password = _passwordController.text;
                  final confirmPassword = _confirmPasswordController.text;
                  if (password != confirmPassword) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content:
                            Text("Les mots de passe ne correspondent pas")));
                    return;
                  }
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RegisterSuiteView(
                              email: email, password: password)));
                },
              ))
            ])));
  }
}

class RegisterSuiteView extends StatelessWidget {
  RegisterSuiteView({super.key, this.email, this.password});
  final String? email;
  final String? password;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
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
                    controller: _surnameController),
                ChampFormulaire(
                    label: "Prénom",
                    texteduchamp: '',
                    controller: _nameController),
                ChampFormulaire(
                    label: "Date de naissance",
                    texteduchamp: 'JJ/MM/AAAA',
                    controller: _dateOfBirthController),
                ChampFormulaire(
                    label: "Numéro de téléphone",
                    texteduchamp: '',
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
                          email: email!,
                          password: password!,
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
