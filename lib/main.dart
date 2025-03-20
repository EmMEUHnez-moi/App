import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:emmeuhnez_moi_app/profil/cubit/login_cubit.dart';
import 'package:emmeuhnez_moi_app/profil/cubit/register_cubit.dart';
import 'package:emmeuhnez_moi_app/profil/repository/login_repository.dart';
import 'package:emmeuhnez_moi_app/profil/repository/register_repository.dart';
import 'package:emmeuhnez_moi_app/app_controler/cubit/app_controller_cubit.dart';
import 'package:emmeuhnez_moi_app/app_controler/cubit_orientation/orientation_cubit.dart';
import 'package:emmeuhnez_moi_app/app_controler/view/root_screen.dart';
import 'package:emmeuhnez_moi_app/message/view/message_view.dart';
import 'package:emmeuhnez_moi_app/profil/view/register_view.dart';
import 'package:emmeuhnez_moi_app/accueil/view/accueil_view.dart';
import 'package:emmeuhnez_moi_app/profil/view/connexion_view.dart';
import 'package:emmeuhnez_moi_app/trajets/view/trajets_view.dart';
import 'package:emmeuhnez_moi_app/favoris/view/favoris_view.dart';

void main() {
  runApp(const AppCovoit());
}

class AppCovoit extends StatelessWidget {
  const AppCovoit({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AppControllerCubit(),
        ),
        BlocProvider(
          create: (context) => LoginBloc(LoginRepository()),
        ),
        BlocProvider(
          create: (context) => RegisterBloc(RegisterRepository()),
        ),
        BlocProvider(create: (context) => OrientationCubit()),
      ],
      child: MaterialApp(
          title: 'Flutter Essai',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
                seedColor: Colors.deepPurple, brightness: Brightness.light),
            useMaterial3: true,
            brightness: Brightness.light,
          ),
          darkTheme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
                seedColor: Colors.deepPurple, brightness: Brightness.dark),
            useMaterial3: true,
            brightness: Brightness.dark,
            /* dark theme settings */
          ),
          themeMode: ThemeMode.system,
          debugShowCheckedModeBanner: false,
          home: BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
            if (state is LoginSuccess) {
              return RootScreen();
            } else if (state is LoginFailure) {
              return FirstPage();
            } else {
              return FirstPage();
            }
          })),
    );
  }
}

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  final int _currentIndex = 0;
  final List<Widget> _connectorinscrip = [
    ConnexionView(),
    RegisterView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _connectorinscrip[_currentIndex],
      appBar: AppBar(
        title: Text('Identifiez-vous'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  final List<Widget> _screens = [
    AccueilView(),
    TrajetsView(),
    FavorisView(),
    MessageView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Accueil',
              backgroundColor: Colors.deepPurple),
          BottomNavigationBarItem(
              icon: Icon(Icons.directions_car),
              label: 'Mes Trajets',
              backgroundColor: Colors.deepPurple),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Mes Favoris',
              backgroundColor: Colors.deepPurple),
          BottomNavigationBarItem(
              icon: Icon(Icons.message),
              label: 'Messagerie',
              backgroundColor: Colors.deepPurple),
        ],
      ),
    );
  }
}

/*
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      )
    );
  }
}
*/
