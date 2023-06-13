import 'package:flutter/material.dart';
import 'package:pokedex/modules/common/controller/controller_pokemon.dart';
import 'package:pokedex/modules/home/ui/main_home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  
    return MaterialApp(
      title: 'Lista de Pokemons',
      theme: ThemeData(primarySwatch: Colors.green,
      ),
      home:  MainHome(controllerPokemon:  ControllerPokemon(), ),
      
    );
  }
}
