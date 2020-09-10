part of 'players_bloc.dart';

@immutable
abstract class PlayersState {}

class PlayersUninitialized extends PlayersState {}

class PlayerFetching extends PlayersState {}

class PlayerFetched extends PlayersState {
  final List<Players> players;
  PlayerFetched({@required this.players});
}

class PlayerEmpty extends PlayersState {}

class PlayerError extends PlayersState {}
