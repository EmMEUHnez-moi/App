import 'package:flutter/material.dart';
import 'package:emmeuhnez_moi_app/colors_theme.dart';

enum NavbarItem { home, trajet, favori, message }

List<BottomNavigationBarItem> items = [
  BottomNavigationBarItem(
      icon: const Icon(Icons.home),
      label: 'Accueil',
      tooltip: 'Ouvre la page Accueil',
      backgroundColor: ColorsApp().deepPurple),
  BottomNavigationBarItem(
      icon: Icon(Icons.directions_car),
      label: 'Mes Trajets',
      tooltip: 'Ouvre les trajets',
      backgroundColor: ColorsApp().deepPurple),
  BottomNavigationBarItem(
      icon: Icon(Icons.favorite),
      label: 'Mes Favoris',
      tooltip: 'Ouvre les favoris',
      backgroundColor: ColorsApp().deepPurple),
  BottomNavigationBarItem(
      icon: Icon(Icons.message),
      label: 'Messagerie',
      tooltip: 'Ouvre les reglages',
      backgroundColor: ColorsApp().deepPurple),
];
