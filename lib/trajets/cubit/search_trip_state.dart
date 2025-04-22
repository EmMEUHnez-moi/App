part of 'search_trip_cubit.dart';

abstract class SearchState {}

class SearchQueryInitial extends SearchState {}

class SearchQueryLoading extends SearchState {}

class SearchQuerySuccess extends SearchState {
  final List<Trip> results;

  SearchQuerySuccess(this.results);
}

class SearchQueryNoResults extends SearchState {}

class SearchQueryFailure extends SearchState {
  final String error;

  SearchQueryFailure(this.error);
}

class SearchMineTripConfirmed extends SearchState {
  final String query;

  SearchMineTripConfirmed(this.query);
}

class SearchMineTripInitial extends SearchState {}

class SearchMineTripLoading extends SearchState {}

class SearchMineTripSuccess extends SearchState {
  final List<Trip> results;

  SearchMineTripSuccess(this.results);
}

class SearchMineTripNoResults extends SearchState {}

class SearchMineTripFailure extends SearchState {
  final String error;

  SearchMineTripFailure(this.error);
}

class SearchQueryConfirmed extends SearchState {
  final String query;

  SearchQueryConfirmed(this.query);
}
