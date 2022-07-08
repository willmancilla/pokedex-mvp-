import 'package:flutter/material.dart';
import 'package:pokedex/model/pokemon.dart';

class Info extends StatelessWidget {
  const Info({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Pokemon info = ModalRoute.of(context)!.settings.arguments as Pokemon;
    
    return Scaffold(
      appBar: AppBar(
        title: Text('${info.name}'),
      ),
      body: Card(
        margin: const EdgeInsets.fromLTRB(10, 10, 10, 122),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Stack(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(17)),
                        color: Color.fromARGB(108, 214, 214, 209),
                      ),
                      width: double.infinity,
                      child: Image.network(info.thumbnailImage ?? ''),
                    ),
                    Container(
                      alignment: Alignment.topRight,
                      padding: const EdgeInsets.only(top: 15, right: 15),
                      child: Text('#${info.number}'),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                '${info.description}',
                textAlign: TextAlign.justify,
              ),
              const Divider(
                height: 25,
                thickness: 1,
              ),
              const Text(
                'Tipo:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 3,
              ),
              Text(info.type!.join(' / ')),
              const Divider(
                height: 25,
                thickness: 1,
              ),
              const Text(
                'Fraquezas:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 3,
              ),
              Text(info.weakness!.join(' / ')),
            ],
          ),
        ),
      ),
    );
  }
}