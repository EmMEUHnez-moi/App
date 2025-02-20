import 'package:emmeuhnez_moi_app/custom.dart';
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
      home: PremierePage(),
    );
  }
}

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  int _currentIndex = 0;
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

class ConnectPage extends StatelessWidget {
  const ConnectPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Connectez-vous'),
      ),
      body: Padding( padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[ Text('Identifiant ou mail')],),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  labelText: '',
                  border: OutlineInputBorder(),),),
            ),
            Row(
              children: <Widget>[ Text('Mot de passe')],),
            Expanded( //test du mot correct ou incorrect
              child: TextField(
              decoration: InputDecoration(
                labelText: '',
                border: OutlineInputBorder(),),),
            ),
            Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => InscripPage())
                  );
                },
                child: Text("Vous n'avez pas de compte, inscrivez-vous en cliquant ici")
              ),),
              Center(
                child: ElevatedButton( //mettre conditions et erreurs
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyHomePage()));
                  },
                  child: Text('Connecter')
                ) 
              )
          ]      
        )
        )
    );
  }
}

class InscripPage extends StatelessWidget {
  const InscripPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text('Inscrivez-vous')),
      body: Padding(padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[Text('Mail')],),
            Expanded(
               child: TextField(
                decoration: InputDecoration(
                  labelText: '',
                  border: OutlineInputBorder(),),),
            ),
            Row(
              children: <Widget>[Text('Mot de passe')],),
            Expanded(
               child: TextField(
                decoration: InputDecoration(
                  labelText: '',
                  border: OutlineInputBorder(),),),
            ),   
            Row(
              children: <Widget>[Text('Confirmation du mot de passe')],),
            Expanded( //condition à mettre !!
               child: TextField(
                decoration: InputDecoration(
                  labelText: '',
                  border: OutlineInputBorder(),),),
            ), 
            Center(
                child: ElevatedButton( //mettre conditions et erreurs
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => InscripSuitePage()));
                  },
                  child: Text("S'inscrire")
                ) 
              )
          ]
        )
      )
    );
}
}

class InscripSuitePage extends StatelessWidget {
  const InscripSuitePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Inscription'),), 
      body: Padding(padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[Text('Nom')],),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  labelText: '', 
                  border: OutlineInputBorder())),),
            Row(
              children: <Widget>[Text('Prénom')],),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  labelText: '', 
                  border: OutlineInputBorder())),),
            Row(
              children: <Widget>[Text('Date de naissance')],),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'JJ/MM/AAAA', 
                  border: OutlineInputBorder())),),
            Row(
              children: <Widget>[Text('Numéro de téléphone')],),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  labelText: '', 
                  border: OutlineInputBorder())),),
            Center(
                child: ElevatedButton( //mettre conditions et erreurs
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyHomePage()));
                  },
                  child: Text("Terminer")))
            ],)
      )
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

class MesTrajetsScreen extends StatelessWidget {
  const MesTrajetsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PageTrajets());
  }
}

class MessageScreen extends StatelessWidget {
  const MessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PageMessage());
  }
}

class FavorisScreen extends StatelessWidget {
  const FavorisScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PageFavoris());
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

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      )
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PageAccueil());
  }
}

class AjouterTrajetPage extends StatelessWidget {
  const AjouterTrajetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Ajouter un trajet")),
      body: Padding(padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[Text("Lieu de départ")],),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  labelText: '', 
                  border: OutlineInputBorder()),)),
            Row(
              children: <Widget>[Text("Destination")],),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  labelText: '', 
                  border: OutlineInputBorder()),)),
            Row(
              children: <Widget>[Text("Date de départ")],),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'JJ/MM/AAAA', 
                  border: OutlineInputBorder()),)),
            Row(
              children: <Widget>[Text("Horaire de départ")],),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'HH:MM', 
                  border: OutlineInputBorder()),)),
            Row(
              children: <Widget>[Text("Places disponibles")],),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  labelText: '', 
                  border: OutlineInputBorder()),)),
            Row(
              children: <Widget>[Text("Lieu de RDV")],),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  labelText: '', 
                  border: OutlineInputBorder()),)),
            //Row(children: PriveouPublic(),),
          ],))
    );
  }
}
/*
class PriveouPublic extends StatefulWidget {
  const PriveouPublic({super.key});

  @override
  
}
*/
