import 'package:flutter/cupertino.dart';
import 'package:pokedex/model/repositories/repository.dart';
import '../model/pokemon.dart';

class PokemonPresenter with ChangeNotifier{
  final Repository repository;

  PokemonPresenter(this.repository);

  List<Pokemon> listaPokemon = [];
  bool loading = true;

  void getPokemon() async{
    loading = true;

    listaPokemon = await repository.getPokemon();
    notifyListeners();

    loading = false;
  }
}