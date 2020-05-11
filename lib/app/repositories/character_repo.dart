import 'dart:convert';

import 'package:marvel_api/app/models/character_model.dart';
import 'package:http/http.dart' as http;
import 'package:marvel_api/app/models/comics_model.dart';
import 'package:marvel_api/constants/url.dart';

class CharacterRepository {
  Future<List<Character>> fetchCharactersByStartsWith(String startsWith) async {
    String url = 'https://gateway.marvel.com:443/v1/public/characters?' +
        'nameStartsWith=$startsWith' + Constants.API_KEY;
        //'&ts=42&apikey=592bddb193bffbeb19346961c9f3e7ab&hash=2279ddd726d556fda9e8dcb4ce95c06b';


    var response = await http.get(url);

    List<Character> characters = [];

    if (response.statusCode == 200) {
      Map<String, dynamic> body = jsonDecode(response.body)['data'];

      for (var item in body['results']) {
        Character char = Character.fromJson(item);
        //print(char.thumbnailExt);

        characters.add(char);
      }
    }

    return characters;
  }

  Future<List<Comics>> comicsByCharacter(String charId) async {
    String url =
        'https://gateway.marvel.com:443/v1/public/characters/$charId/comics?ts=42&apikey=592bddb193bffbeb19346961c9f3e7ab&hash=2279ddd726d556fda9e8dcb4ce95c06b';

    var response = await http.get(url);

    List<Comics> comics = [];

    if (response.statusCode == 200) {
      Map<String, dynamic> body = jsonDecode(response.body)['data'];

      for (var item in body['results']) {
        Comics comic = Comics.fromJson(item);
        comics.add(comic);
      }
    }

    return comics;
  }
}
