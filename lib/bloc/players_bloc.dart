import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_ex/player_repo/player_repo.dart';
import 'package:meta/meta.dart';
import 'package:bloc_ex/model/nations.dart';
import 'package:bloc_ex/model/api_model.dart';

part 'players_event.dart';
part 'players_state.dart';

class PlayersBloc extends Bloc<PlayersEvent, PlayersState> {
  final PlayerRepo playerRepo;
  PlayersBloc({this.playerRepo}) : super(PlayersUninitialized());

  // @override
  // Stream<PlayersState> transformEvents(Stream<PlayersEvent> events,
  //     Stream<PlayersState> Function(PlayersEvent event) next) {
  //   // TODO: implement transformEvents
  //   return super.transformEvents(
  //     (events as Observable<PlayersEvent>).debounce(
  //         (_) => TimerStream(true, const Duration(milliseconds: 250))),
  //     next,
  //   );
  // }

  @override
  void onTransition(Transition<PlayersEvent, PlayersState> transition) {
    super.onTransition(transition);
    print(transition);
  }

  @override
  Stream<PlayersState> mapEventToState(
    PlayersEvent event,
  ) async* {
    yield PlayerFetching();
    List<Players> players;
    try {
      if (event is CountrySelected) {
        players = await playerRepo.fetchByCountry(event.nationModel.countryId);
      } else if (event is SearchTextChange) {
        print("Hitting service");
        players = await playerRepo.fetchByName(event.searchTerm);
      }
      if (players.length == 0) {
        yield PlayerEmpty();
      } else {
        yield PlayerFetched(players: players);
      }
    } catch (_) {
      yield PlayerError();
    }
  }
}
