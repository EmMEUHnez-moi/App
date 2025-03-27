import 'package:flutter/material.dart';

class FavorisView extends StatefulWidget {
  const FavorisView({super.key});

  @override
  State<FavorisView> createState() => FavorisViewState();
}

class FavorisViewState extends State<FavorisView>
  with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    tabController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mes favoris", style: TextStyle(color: Colors.deepPurple)),
        bottom: TabBar(controller: tabController, tabs: [
          Tab(
            text: "Utilisateurs",
          ),
          Tab(
            text: "Trajets",
          )
        ]),
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          TrajetfavPage(),
          UtilisateurfavPage(),
        ],
      ),
    );
  }
}



class TrajetfavPage extends StatelessWidget {
  const TrajetfavPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

class UtilisateurfavPage extends StatelessWidget {
  const UtilisateurfavPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
