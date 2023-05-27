// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:pokedex/core/models/data_page_model.dart';

import 'package:pokedex/core/models/pokemon_model.dart';
import 'package:pokedex/modules/common/repositories/repository_pokemon.dart';
import 'package:pokedex/modules/screen_pokemons/ui/screen/carregando.dart';
import 'package:pokedex/modules/screen_pokemons/ui/screen/screen_all_pokemons.dart';

class MainHome extends StatelessWidget {
  const MainHome({
    Key? key,
    required this.repositoryPokemon,
  }) : super(key: key);

  final RepositoryPokemon repositoryPokemon;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<PokemonModel>>(
        future: repositoryPokemon.getAllPokemons(page: 0),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Carregando();
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return ScreenAllPokemons(
                list: snapshot.data!, repositoryPokemon: repositoryPokemon, /*  list: ['teste', "teste2"]  */);
          }
          if (snapshot.hasError) {
            return Center(
              child: Text('Erro ao Carregar informações ${snapshot.error}'),
            );
          }
          return const Text('Tente atualizar novamente');
        });
  }
}
