import 'package:flutter/material.dart';
import 'package:pokedex/model/repositories/repository.dart';
import 'package:pokedex/presenter/pokemon_presenter.dart';
import 'view/home_page.dart';
import 'view/info_page.dart';
import 'package:provider/provider.dart';

void main() {

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => PokemonPresenter(Repository()),)
    ],
    child: const MyApp(),
  ),
 );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pokedex',
      theme: ThemeData(         
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/':(context) => const PagInicial(),
        '/info':(context) => const Info(),
      },
      initialRoute: '/',
    );
  }
}