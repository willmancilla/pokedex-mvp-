import 'package:flutter/cupertino.dart';
import 'package:pokedex/model/repositories/repository.dart';
import '../model/pokemon.dart';

class PokemonPresenter extends ChangeNotifier {
  final Repository repository;
  List<Pokemon> listaPokemon = [];
  bool loading = true;

  PokemonPresenter(this.repository);

  void getPokemon() async {
    loading;

    listaPokemon = await repository.getPokemon();
    notifyListeners();

    loading = false;
  }
}
