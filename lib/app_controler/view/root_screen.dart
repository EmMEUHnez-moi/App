import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:emmeuhnez_moi_app/app_controler/Widget/menu_items.dart';
import 'package:emmeuhnez_moi_app/app_controler/cubit/app_controller_cubit.dart';
import 'package:emmeuhnez_moi_app/accueil/view/accueil_view.dart';
import 'package:emmeuhnez_moi_app/trajets/view/trajets_view.dart';
import 'package:emmeuhnez_moi_app/favoris/view/favoris_view.dart';
import 'package:emmeuhnez_moi_app/message/view/message_view.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  RootScreenState createState() => RootScreenState();
}

class RootScreenState extends State<RootScreen> {
  @override
  Widget build(BuildContext context) {
    /*//Gestion de l'orientation
    Orientation orientation = MediaQuery.of(context).orientation;
    Size size = MediaQuery.of(context).size;
    //definition du mode d'affichage
    
    if (size.width > 900 || orientation == Orientation.landscape) {
      BlocProvider.of<OrientationCubit>(context)
          .getOrientationState(OrientationItem.paysage);
    } else {
      BlocProvider.of<OrientationCubit>(context)
          .getOrientationState(OrientationItem.portrait);
    }*/

    //Scaffold du menu
    return Scaffold(
      bottomNavigationBar: BlocBuilder<AppControllerCubit, AppControllerState>(
          builder: (context, state) {
        return BottomNavigationBar(
          currentIndex: state.index,
          showUnselectedLabels: false,
          items: items,
          onTap: (index) {
            if (index == 0) {
              BlocProvider.of<AppControllerCubit>(context)
                  .getNavBarItem(NavbarItem.home);
            } else if (index == 1) {
              BlocProvider.of<AppControllerCubit>(context)
                  .getNavBarItem(NavbarItem.trajet);
            } else if (index == 2) {
              BlocProvider.of<AppControllerCubit>(context)
                  .getNavBarItem(NavbarItem.favori);
            } else if (index == 3) {
              BlocProvider.of<AppControllerCubit>(context)
                  .getNavBarItem(NavbarItem.message);
            }
          },
        );
      }),
      body: BlocBuilder<AppControllerCubit, AppControllerState>(
          //bloc: AppControllerCubit(),
          builder: (context, state) {
        if (state.navbarItem == NavbarItem.home) {
          return AccueilView();
        } else if (state.navbarItem == NavbarItem.trajet) {
          return TrajetsView();
        } else if (state.navbarItem == NavbarItem.favori) {
          return FavorisView();
        } else if (state.navbarItem == NavbarItem.message) {
          return MessageView();
        }
        return Text('Erreur Selection page');
      }),
    );
  }

//Fonction pour creer le titre de la page en fonction des etats des cubit

  String getAppBarTitle(String appBarTitle, bool menuBilan, String bilanTitle) {
    if (menuBilan) {
      return '$appBarTitle/$bilanTitle';
    }
    return appBarTitle;
  }
}
