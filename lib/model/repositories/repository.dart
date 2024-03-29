import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pokedex/model/pokemon.dart';

class Repository {
  Future<List<Pokemon>> getPokemon() async {
    var url = Uri.parse('http://104.131.18.84/pokemon/?limit=50&page=0');
    List<Pokemon> listaPokemon = [];

    final resultado = await http.get(url);
    if (resultado.statusCode == 200) {
      Map json = jsonDecode(resultado.body);

      for (var e in (json['data'] as List)) {
        listaPokemon.add(Pokemon.fromJson(e));
      }
      return listaPokemon;
    }
    return listaPokemon;
  }
}
