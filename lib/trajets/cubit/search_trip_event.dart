part of 'search_trip_cubit.dart';

abstract class SearchEvent {}

class SearchQuerySubmitted extends SearchEvent {
  final String fromLocation;
  final String toLocation;
  final TimeOfDay hourOfDeparture;
  final String user;

  SearchQuerySubmitted(
      this.fromLocation, this.toLocation, this.hourOfDeparture, this.user);
}

class SearchQueryCancelled extends SearchEvent {}

class SearchMineTripSubmitted extends SearchEvent {}

class SearchMineTripCancelled extends SearchEvent {}
