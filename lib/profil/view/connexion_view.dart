import 'package:emmeuhnez_moi_app/profil/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:emmeuhnez_moi_app/accueil/widget/button_accueil.dart';
import 'package:emmeuhnez_moi_app/trajets/widget/champforumlaire_picker.dart';
import 'package:emmeuhnez_moi_app/main.dart';
import 'package:emmeuhnez_moi_app/profil/view/register_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConnexionView extends StatelessWidget {
  ConnexionView({super.key});
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Connectez-vous'),
        ),
        body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(children: <Widget>[
              ChampFormulaire(
                label: "Identifiant ou mail",
                texteduchamp: '',
                controller: _emailController,
              ),
              ChampFormulaire(
                label: "Mot de passe",
                texteduchamp: '',
                controller: _passwordController,
              ),
              Center(
                child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterView()));
                    },
                    child: Text(
                        "Vous n'avez pas de compte, inscrivez-vous en cliquant ici")),
              ),
              BlocConsumer<LoginBloc, LoginState>(listener: (context, state) {
                if (state is LoginSuccess) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Connexion réussie !")));
                } else if (state is LoginFailure) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Erreur : ${state.error}")));
                }
              }, builder: (context, state) {
                if (state is LoginLoading) {
                  return CircularProgressIndicator();
                }
                return ElevatedButton(
                  onPressed: () {
                    final email = _emailController.text;
                    final password = _passwordController.text;
                    context
                        .read<LoginBloc>()
                        .add(LoginSubmitted(email: email, password: password));
                  },
                  child: Text("Connexion"),
                );
              }),
            ])));
  }
}
