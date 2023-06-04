/* import 'package:flutter/material.dart';
import 'package:pokedex/core/models/data_page_model.dart';
import 'package:pokedex/core/styles/custom_colors.dart';
import 'package:pokedex/core/styles/text_extension.dart';
import 'package:pokedex/modules/common/repositories/repository_pokemon.dart';
import 'package:pokedex/modules/screen_pokemons/ui/screen/view_pokemon.dart';

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
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: GradeCard(context),
            ),
          ),
          IconButton(
            onPressed: (() {
              repositoryPokemon.getAllPokemons(pg: 5/* url:data.next.toString() */);
              
             }),
            icon: const Icon(Icons.arrow_right),
          ),
        ],
      ),
    );
  }

  GridView GradeCard(context) {
    return GridView.count(
      crossAxisCount: 3,
      children: List.generate(data.pokemons!.length, (index) {
        return GestureDetector(
          onTap: () {
      Navigator.of(context).push(MaterialPageRoute(builder: (context)=> ViewPokemon(pokemon: data.pokemons![index],)));

            print('Cliclou no ${data.pokemons![index].name}');
          },
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(97, 215, 216, 218),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  data.pokemons?[index].sprites?.frontDefault == null
                      ? Container(
                          margin: const EdgeInsets.all(2),
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                            border:
                                Border.all(width: 1, color: CustomColors.red),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: const Center(child: Text('No image')),
                        )
                      : Container(
                          margin: const EdgeInsets.all(2),
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                            border:
                                Border.all(width: 1, color: CustomColors.red),
                            borderRadius: BorderRadius.circular(50),
                            image: DecorationImage(
                              image: NetworkImage(data
                                  .pokemons![index].sprites!.frontDefault
                                  .toString()),
                            ),
                          ),
                        ),
                  Text('${data.pokemons?[index].name.toString()}').titleName,
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
 */