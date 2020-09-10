import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:bloc_ex/model/api_model.dart';

class PlayerApiProvider {

  String baseUrl = "https://www.easports.com/fifa/ultimate-team/api/fut/item?";

  final successCode = 200;

  Future<List<Players>> fetchByCountry(String countryID) async {
    final response = await http.get(baseUrl + "country=" + countryID);
    return parseResponse(response);
  }

  Future<List<Players>> fetchByName(String playerName) async {
    final response = await http.get(baseUrl + "name=" + playerName);
    return parseResponse(response);
  }

  List<Players> parseResponse(http.Response response) {
    final responseString = jsonDecode(response.body);

    if (response.statusCode == successCode) {
      return ApiResult
          .fromJson(responseString)
          .items;
    } else {
      throw Exception('failed to load players');
    }
  }
}
