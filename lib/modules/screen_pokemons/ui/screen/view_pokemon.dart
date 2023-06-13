// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:pokedex/core/models/pokemon_model.dart';
import 'package:pokedex/core/styles/text_extension.dart';

// ignore: must_be_immutable
class ViewPokemon extends StatelessWidget {
  PokemonModel pokemon;
  ViewPokemon({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Flexible(
                flex: 4,
                child: Container(
                  decoration: BoxDecoration(
                    color:
                        getStatusColor(pokemon.types![0].type?.name.toString()),
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(12, 30, 12, 30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "${pokemon.name}".toUpperCase(),
                            ).titleName,
                            IconButton(
                                onPressed: () =>
                                    Navigator.pop(context), // Get.back(),
                                iconSize: 24,
                                icon: const Icon(Icons.close)),
                          ],
                        ),
                        if (pokemon.types != null)
                          for (var i = 0; i < pokemon.types!.length; i++)
                            Padding(
                              padding: const EdgeInsets.all(1.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 248, 246, 246),
                                  borderRadius: BorderRadius.circular(40),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(6.0),
                                  child: Text(
                                      pokemon.types![i].type!.name.toString()),
                                ),
                              ),
                            ),
                        const Expanded(child: SizedBox()),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RichText(
                              text: TextSpan(
                                style: const TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.white,
                                ),
                                children: <TextSpan>[
                                  const TextSpan(text: 'Weight: '),
                                  TextSpan(
                                      text: ('${pokemon.weight!.toInt() / 10} Kg' ).toString(),
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ),
                            RichText(
                              text: TextSpan(
                                style: const TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.white,
                                ),
                                children: <TextSpan>[
                                  const TextSpan(text: 'Height: '),
                                  TextSpan(
                                      text: ('${pokemon.height!.toInt() /10 } m' ).toString(),
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 6,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Row(
                            children: [
                              const Text('Abilities: '),
                              for (var i = 0;
                                  i < pokemon.abilities!.length;
                                  i++)
                                Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color:  getStatusColor(pokemon.types![0].type?.name.toString()),
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                                      child: Text(
                                          pokemon.abilities![i].ability!.name
                                              .toString(),
                                          ).abilities,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                        const Divider(
                          thickness: 2,
                          height: 10,
                        ),
                        for (var i = 0; i < pokemon.stats!.length; i++)
                          Padding(
                            padding: const EdgeInsets.only(bottom: 1),
                            child: Container(
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 209, 208, 208),
                                borderRadius: BorderRadius.circular(50),
                              ),
                              width: 300,
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('${pokemon.stats![i].stat!.name}: '
                                        .toString()),
                                    Text(pokemon.stats![i].baseStat.toString(),
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold))
                                  ],
                                ),
                              ),
                            ),
                          ),
                      ]),
                ),
              ),
            ],
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  flex: 3,
                  child: Text('ID: ${pokemon.order.toString()}',
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold)),
                ),
                Flexible(
                  flex: 6,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: loadImg(pokemon
                        .sprites!.other!.officialArtwork!.frontDefault
                        .toString()),
                  ),
                ),
                Flexible(flex: 2, child: Container())
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget loadImg(String url) {
  return ClipRRect(
    child: Image.network(
      url,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;
        return const CircularProgressIndicator();
      },
      errorBuilder: (context, child, stackTrace) {
        return Container(
          color: Colors.grey[300],
          height: 40,
          width: 40,
        );
      },
      height: 240,
      width: 240,
      fit: BoxFit.cover,
    ),
  );
}

Color getStatusColor(String? color) {
  switch (color) {
    case 'grass':
      return const Color.fromARGB(255, 12, 92, 14);
    case 'fire':
      return const Color.fromARGB(255, 223, 35, 2);
    case 'poison':
      return const Color.fromARGB(255, 79, 2, 143);
    case 'electric':
      return const Color.fromARGB(255, 202, 182, 1);
    case 'ground':
      return const Color.fromARGB(248, 73, 43, 5);
    case 'fighting':
      return const Color.fromARGB(248, 22, 14, 110);
    case 'water':
      return const Color.fromARGB(255, 6, 2, 245);
    case 'ice':
      return const Color.fromARGB(255, 3, 192, 250);
    case 'flying':
      return const Color.fromARGB(255, 147, 199, 248);
    case 'psychic':
      return const Color.fromARGB(255, 245, 73, 230);
    case 'steel':
      return const Color.fromARGB(255, 64, 64, 85);
    default:
      return const Color.fromARGB(255, 49, 49, 49);
  }
}
