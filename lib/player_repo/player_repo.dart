import 'package:bloc_ex/provider/player_api_provider.dart';
import 'package:bloc_ex/model/api_model.dart';

class PlayerRepo {
  PlayerApiProvider _playerApiProvider = PlayerApiProvider();

  Future<List<Players>> fetchByCountry(String countryID) =>
      _playerApiProvider.fetchByCountry(countryID);
  Future<List<Players>> fetchByName(String playerName) =>
      _playerApiProvider.fetchByName(playerName);
}
