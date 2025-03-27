import 'package:emmeuhnez_moi_app/favoris/view/trajet_fav_view.dart';
import 'package:emmeuhnez_moi_app/favoris/view/utilisateur_fav_view.dart';
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
          title:
              Text("Mes favoris", style: TextStyle(color: Colors.deepPurple)),
          bottom: TabBar(controller: tabController, labelColor: Colors.deepPurple, tabs : [
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
            UtilisateurfavView(),
            TrajetfavView(),
          ],
        ));
  }
}