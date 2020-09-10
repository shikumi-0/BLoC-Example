part of 'players_bloc.dart';

@immutable
abstract class PlayersEvent {}

class CountrySelected extends PlayersEvent {
  final NationModel nationModel;
  CountrySelected({@required this.nationModel}) : assert(nationModel != null);
}

class SearchTextChange extends PlayersEvent {
  final String searchTerm;

  SearchTextChange({@required this.searchTerm}) : assert(searchTerm != null);
}
