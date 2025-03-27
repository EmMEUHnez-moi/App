import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:emmeuhnez_moi_app/app_controler/Widget/menu_items.dart';
import 'package:equatable/equatable.dart';
part 'app_controller_state.dart';

class AppControllerCubit extends Cubit<AppControllerState> {
  AppControllerCubit()
      : super(AppControllerState(NavbarItem.home, 0, 'Accueil'));

  void getNavBarItem(NavbarItem navbarItem) {
    switch (navbarItem) {
      case NavbarItem.home:
        emit(AppControllerState(NavbarItem.home, 0, 'Accueil'));
        break;
      case NavbarItem.trajet:
        emit(AppControllerState(NavbarItem.trajet, 1, 'Trajets'));
        break;
      case NavbarItem.favori:
        emit(AppControllerState(NavbarItem.favori, 2, 'Favoris'));
        break;
      case NavbarItem.message:
        emit(AppControllerState(NavbarItem.message, 3, 'Message'));
        break;
    }
  }
}
