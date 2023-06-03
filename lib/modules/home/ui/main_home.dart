// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:pokedex/core/models/data_page_model.dart';
import 'package:pokedex/modules/common/repositories/repository_pokemon.dart';

import 'package:pokedex/modules/screen_pokemons/ui/screen/screen_all_pokemons.dart';

class MainHome extends StatelessWidget {
  const MainHome({
    Key? key,
    required this.repositoryPokemon,
  }) : super(key: key);

  final RepositoryPokemon repositoryPokemon;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DataPageModel>(
        future: repositoryPokemon.getAllPokemons(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: Colors.green,
                ),
              ),
            );
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return ScreenAllPokemons(
                data: snapshot.data!, repositoryPokemon: repositoryPokemon, );
          }
          if (snapshot.hasError) {
            return Scaffold(
              body: Center(
                child: Text('Erro ao Carregar informações ${snapshot.error}'),
              ),
            );
          }
          return const Scaffold(body: Center(child: Text('Tente atualizar novamente')));
        });
  }
}
