import 'dart:convert';

import 'package:bloc_example_jscarl/models/marvels.dart';
import 'package:http/http.dart' as http;
import 'package:crypto/crypto.dart';

class MarvelServices {
  static final MarvelServices _instances = MarvelServices._internal();
  factory MarvelServices() { return _instances; }
  MarvelServices._internal();

  static final String baseUrl = "https://gateway.marvel.com/v1/public";
  static const String privateKey = "71b0a849fd6ba097927bbc3addfa44da209955ac";
  static const String publicKey = "610c99ed9e3c1773ecfb1fd81c616375";

  int get currentDate => new DateTime.now().millisecondsSinceEpoch;

  combineHash(int dateTime, {String privateKey = privateKey, String publicKey = publicKey}){
    var dateHash = utf8.encode(dateTime.toString());
    var privateKeyHash = utf8.encode(privateKey);
    var publicKeyHash = utf8.encode(publicKey);

    return md5.convert(dateHash + privateKeyHash + publicKeyHash);
  }

  Future<List<Characters>> getMarvelCharacters(int offset, int limit) async {
    final dates = currentDate;
    final String credentials = "apikey=$publicKey&hash=${combineHash(dates)}&ts=$dates";
    final response = await http.get("$baseUrl/characters?$credentials&offset=$offset&limit=$limit&orderBy=-modified");
    if(response.statusCode == 200) {
      var data = json.decode(response.body);
      List characterJson = data['data']['results'];
      print(characterJson.length);
      return characterJson.map((characters) => Characters.fromJson(characters)).toList();
    } else {
      throw Exception('Request failed with status: ${response.statusCode} & ${response.body}.');
    }
  }
} 