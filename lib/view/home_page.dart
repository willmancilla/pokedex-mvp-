import 'package:flutter/material.dart';
import 'package:pokedex/presenter/pokemon_presenter.dart';
import 'package:provider/provider.dart';

class PagInicial extends StatefulWidget {
  const PagInicial({Key? key}) : super(key: key);

  @override
  State<PagInicial> createState() => _PagInicialState();
}

class _PagInicialState extends State<PagInicial> {
  @override
  void initState() {
    context.read<PokemonPresenter>().getPokemon();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Container(
              padding: const EdgeInsets.only(right: 205),
              child: const Text('Pokedex'),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Image.network(
                'https://raw.githubusercontent.com/RafaelBarbosatec/SimplePokedex/master/assets/pokebola_img.png',
                height: 45,
              ),
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          Consumer<PokemonPresenter>(
            builder: (_, p, w) {
              return ListView.builder(
                itemCount: p.listaPokemon.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 12, bottom: 12),
                      child: ListTile(
                        title: Text(p.listaPokemon[index].name ?? ''),
                        onTap: () {
                          Navigator.of(context).pushNamed('/info',
                              arguments: p.listaPokemon[index]);
                        },
                        leading: Image.network(
                            p.listaPokemon[index].thumbnailImage ?? ''),
                        trailing: Text(
                          '#${p.listaPokemon[index].number ?? ''}',
                          style: const TextStyle(
                              color: Color.fromARGB(255, 68, 68, 68)),
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          ),
          if (context.watch<PokemonPresenter>().loading)
            const Center(
              child: CircularProgressIndicator(),
            ),
        ],
      ),
    );
  }
}
