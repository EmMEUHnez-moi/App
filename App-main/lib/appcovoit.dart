import 'package:emmeuhnez_moi_app/Accueil.dart';
import 'ConnectInscrip.dart';
import 'MesTrajetsScreen.dart';
import 'Favoris.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const AppCovoit());
}

class AppCovoit extends StatelessWidget {
  const AppCovoit({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Essai',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple, brightness: Brightness.light),
        useMaterial3: true,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple, brightness: Brightness.dark),
        useMaterial3: true,
        brightness: Brightness.dark,
        /* dark theme settings */
      ),
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      home: FirstPage(),
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
    ConnectPage(),
    InscripPage(),
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
    HomeScreen(),
    MesTrajetsScreen(),
    FavorisScreen(),
    MessageScreen(),
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
            backgroundColor: Colors.deepPurple
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.directions_car),
            label: 'Mes Trajets',
            backgroundColor: Colors.deepPurple
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Mes Favoris',
            backgroundColor: Colors.deepPurple
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Messagerie',
            backgroundColor: Colors.deepPurple
          ),
        ],
      ),
    );
  }
}


class MessageScreen extends StatelessWidget {
  const MessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold();
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