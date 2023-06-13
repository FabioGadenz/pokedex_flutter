import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex/core/styles/custom_colors.dart';
import 'package:pokedex/core/styles/text_extension.dart';
import 'package:pokedex/modules/common/controller/controller_pokemon.dart';
import 'package:pokedex/modules/screen_pokemons/ui/screen/error.dart';
import 'package:pokedex/modules/screen_pokemons/ui/screen/view_pokemon.dart';

class MainHome extends StatelessWidget {
  final ControllerPokemon controllerPokemon;
  const MainHome({Key? key, required this.controllerPokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controllerPokemon.getPokemons();

    return Obx(() {
      if (controllerPokemon.isLoading.value) {
        return SizedBox(
          height: MediaQuery.of(context).size.height / 1.5,
          child: Center(
            child: CircularProgressIndicator(
              strokeWidth: 0.8,
              color: CustomColors.green,
            ),
          ),
        );
      }

      if (controllerPokemon.dataPage.value.pokemons == null) {
        return const ErrorScreen();
      } else {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: CustomColors.backGroundBarColor,
            elevation: 20,
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
                  children: List.generate(
                    controllerPokemon.dataPage.value.pokemons!.length,
                    (index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ViewPokemon(
                                  pokemon: controllerPokemon
                                      .dataPage.value.pokemons![index])));
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
                                controllerPokemon
                                            .dataPage
                                            .value
                                            .pokemons?[index]
                                            .sprites
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
                                            image: NetworkImage(
                                                controllerPokemon
                                                    .dataPage
                                                    .value
                                                    .pokemons![index]
                                                    .sprites!
                                                    .frontDefault
                                                    .toString()),
                                          ),
                                        ),
                                      ),
                                Text('${controllerPokemon.dataPage.value.pokemons?[index].name.toString()}')
                                    .namePokemon,
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (controllerPokemon.dataPage.value.previous != null)
                    SizedBox.fromSize(
                      size: const Size(120, 35),
                      child: Material(
                        borderRadius: BorderRadius.circular(50),
                        color: CustomColors.green,
                        child: InkWell(
                          splashColor: Colors.white,
                          onTap: () {
                            controllerPokemon.isLoading.value = true;
                            controllerPokemon.getPokemons(
                                url: controllerPokemon.dataPage.value.next
                                    .toString());
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.chevron_left,
                                color: Colors.white,
                              ),
                              const Text("Previous").abilities,
                            ],
                          ),
                        ),
                      ),
                    ),
                  const SizedBox(
                    width: 10,
                  ),
                  if (controllerPokemon.dataPage.value.next != null)
                    SizedBox.fromSize(
                      size: const Size(120, 35),
                      child: Material(
                        borderRadius: BorderRadius.circular(50),
                        color: CustomColors.green,
                        child: InkWell(
                          splashColor: Colors.white,
                          onTap: () {
                            controllerPokemon.isLoading.value = true;
                            controllerPokemon.getPokemons(
                                url: controllerPokemon.dataPage.value.next
                                    .toString());
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text("Next").abilities,
                              const Icon(
                                Icons.chevron_right,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ],
          ),
        );
      }
    });
  }
}
