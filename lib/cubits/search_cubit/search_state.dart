part of 'search_cubit.dart';

@immutable
abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchInProgress extends SearchState {}

class SearchNoMatchingResults extends SearchState {}

class SearchInEmptyList extends SearchState {}

class SearchEmptyQuery extends SearchState {}
