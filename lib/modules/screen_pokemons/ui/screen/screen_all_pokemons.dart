import 'package:flutter/material.dart';
import 'package:pokedex/core/models/data_page_model.dart';
import 'package:pokedex/core/models/pokemon_model.dart';
import 'package:pokedex/core/styles/custom_colors.dart';
import 'package:pokedex/modules/common/repositories/repository_pokemon.dart';

class ScreenAllPokemons extends StatelessWidget {
  ScreenAllPokemons({
    Key? key,
    required this.data,
    required this.repositoryPokemon,
  }) : super(key: key);
  final DataPageModel data;
  RepositoryPokemon repositoryPokemon;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.backGroundBarColor,
        elevation: 2,
        centerTitle: true,
        title: const Text(
          'Pokedex',
          style: TextStyle(fontSize: 22),
        ),
      ),
      backgroundColor: CustomColors.backGroundPageColor,
      body: Scaffold(
        
        body: Column(
          children: [
            Container(
              height: 400,
              child: ListView.builder(
                itemCount: data.pokemons?.length,
                itemBuilder: (BuildContext context, int index) => Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        color: Colors.amber,
                        width: 200,
                        height: 80,
                        child: Column(children: [Text('Nome: ${data.pokemons?[index].name.toString()}'),
                      Text('ID: ${data.pokemons?[index].id.toString()}'),]),),
                    )
                    
                    
                  ],
                ),
              ),
            ),
             IconButton(
                    onPressed: (() {}),
                    icon: Icon(Icons.arrow_right),
                  ), 
          ],
        ),
      ),
    );
  }
}
