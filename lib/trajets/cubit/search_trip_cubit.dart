import 'package:bloc/bloc.dart';
import 'package:emmeuhnez_moi_app/trajets/model/trip.dart';
import 'package:emmeuhnez_moi_app/trajets/repository/trajets_repository.dart';
import 'package:flutter/material.dart';
part 'search_trip_state.dart';
part 'search_trip_event.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final TrajetsRepository repository;

  SearchBloc(this.repository) : super(SearchQueryInitial()) {
    on<SearchQuerySubmitted>(_onSearchQuerySubmitted);
    on<SearchQueryCancelled>(_onSearchQueryCancelled);
    on<SearchMineTripSubmitted>(_onSearchMineTripSubmitted);
  }

  Future<void> _onSearchMineTripSubmitted(
      SearchMineTripSubmitted event, Emitter<SearchState> emit) async {
    emit(SearchMineTripLoading());
    try {
      final results = await repository.searchMineTrip();
      if (results.isEmpty) {
        emit(SearchMineTripNoResults());
      } else {
        emit(SearchMineTripSuccess(results));
      }
    } catch (e) {
      emit(SearchMineTripFailure(e.toString()));
    }
  }

  Future<void> _onSearchQuerySubmitted(
      SearchQuerySubmitted event, Emitter<SearchState> emit) async {
    emit(SearchQueryLoading());
    try {
      final results = await repository.searchTrip(event.fromLocation,
          event.toLocation, event.hourOfDeparture, event.user);
      if (results.isEmpty) {
        emit(SearchQueryNoResults());
      } else {
        emit(SearchQuerySuccess(results));
      }
    } catch (e) {
      emit(SearchQueryFailure(e.toString()));
    }
  }

  Future<void> _onSearchQueryCancelled(
      SearchQueryCancelled event, Emitter<SearchState> emit) async {
    emit(SearchQueryInitial());
  }
}
