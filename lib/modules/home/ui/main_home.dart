import 'package:flutter/material.dart';
import 'package:pokedex/core/models/data_page_model.dart';
import 'package:pokedex/core/styles/custom_colors.dart';
import 'package:pokedex/core/styles/text_extension.dart';
import 'package:pokedex/modules/common/repositories/repository_pokemon.dart';
import 'package:pokedex/modules/screen_pokemons/ui/screen/view_pokemon.dart';

class MainHome extends StatefulWidget {
  const MainHome({
    Key? key,
    required this.repositoryPokemon,
  }) : super(key: key);

  final RepositoryPokemon repositoryPokemon;

  @override
  State<MainHome> createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  @override
  Widget build(BuildContext context) {
    Future<DataPageModel> future = widget.repositoryPokemon.getAllPokemons();
    return FutureBuilder<DataPageModel>(
        future: future,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: CustomColors.green,
                ),
              ),
            );
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return /* ScreenAllPokemons(
                data: snapshot.data!, repositoryPokemon: repositoryPokemon, ); */
                Scaffold(
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
                    child: GridView.count(
                      crossAxisCount: 3,
                      children: List.generate(snapshot.data!.pokemons!.length,
                          (index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => ViewPokemon(
                                    pokemon: snapshot.data!.pokemons![index])));
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
                                  snapshot.data?.pokemons?[index].sprites
                                              ?.frontDefault ==
                                          null
                                      ? Container(
                                          margin: const EdgeInsets.all(2),
                                          height: 70,
                                          width: 70,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                width: 1,
                                                color: CustomColors.green),
                                            borderRadius:
                                                BorderRadius.circular(50),
                                          ),
                                          child: const Center(
                                              child: Text('No image')),
                                        )
                                      : Container(
                                          margin: const EdgeInsets.all(2),
                                          height: 70,
                                          width: 70,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                width: 1,
                                                color: CustomColors.green),
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            image: DecorationImage(
                                              image: NetworkImage(snapshot
                                                  .data!
                                                  .pokemons![index]
                                                  .sprites!
                                                  .frontDefault
                                                  .toString()),
                                            ),
                                          ),
                                        ),
                                  Text('${snapshot.data!.pokemons?[index].name.toString()}')
                                      .namePokemon,
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                  IconButton(
                    onPressed: (() {
                      widget.repositoryPokemon
                          .getAllPokemons(url: snapshot.data!.next.toString());
                      setState(() {
                        future;
                      });
                    }),
                    icon: const Icon(Icons.arrow_right),
                  ),
                ],
              ),
            );
          }
          if (snapshot.hasError) {
            return Scaffold(
              body: Center(
                child: Text('Erro ao Carregar informações ${snapshot.error}'),
              ),
            );
          }
          return const Scaffold(
              body: Center(child: Text('Tente atualizar novamente')));
        });
  }
}
