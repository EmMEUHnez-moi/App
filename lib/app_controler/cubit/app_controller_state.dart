part of 'app_controller_cubit.dart';

class AppControllerState extends Equatable {
  final NavbarItem navbarItem;
  final int index;
  final String titleAppbar;

  const AppControllerState(this.navbarItem, this.index, this.titleAppbar);

  @override
  List<Object> get props => [navbarItem, index, titleAppbar];
}
