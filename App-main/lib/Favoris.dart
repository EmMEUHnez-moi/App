import 'package:flutter/material.dart';

class FavorisScreen extends StatelessWidget {
  final ValueNotifier<int> _indice = ValueNotifier<int>(0);
  final List<Widget> _pages = [TrajetfavPage(),UtilisateurfavPage()];

  FavorisScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Mes favoris", style: TextStyle(color: Colors.deepPurple)),),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.deepPurple,),
              child: Text("Favoris", style: TextStyle(color: Colors.white)), ),
            ListTile(
              title: Text("Trajets", style: TextStyle(color: Colors.deepPurple)),
              onTap: () {
                _indice.value = 0;
                Navigator.pop(context);
              },),
            ListTile(
              title: Text("Utilisateurs", style: TextStyle(color: Colors.deepPurple)),
              onTap: () {
                _indice.value = 1;
                Navigator.pop(context);
              },),],),),
      body: ValueListenableBuilder(
        valueListenable: _indice, 
        builder: (context, selectedIndex, child){
          return _pages[selectedIndex];}),
    );
  }
}

class TrajetfavPage extends StatelessWidget {
  const TrajetfavPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Trajets favoris", style: TextStyle(color: Colors.deepPurple)),),
    );
  }
}

class UtilisateurfavPage extends StatelessWidget {
  const UtilisateurfavPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Utilisateurs favoris", style: TextStyle(color: Colors.deepPurple)),),
    );
  }
}