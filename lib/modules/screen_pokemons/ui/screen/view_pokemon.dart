// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:pokedex/core/models/pokemon_model.dart';

class ViewPokemon extends StatelessWidget {
  PokemonModel pokemon;
  ViewPokemon({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Container(
        color: Color.fromARGB(167, 138, 245, 142),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      "${pokemon.name}",
                      style: const TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.3,
                      ),
                    ),
                  ),
                  IconButton(
                      onPressed: () => Navigator.pop(context), // Get.back(),
                      iconSize: 24,
                      alignment: Alignment.topRight,
                      icon: Icon(Icons.close)),
                ],
              ),
              Align(
                alignment: Alignment.topCenter,
                child: (pokemon.sprites?.frontDefault == null)
                    ? Container(
                        alignment: Alignment.center,
                        color: Colors.grey[300],
                        height: 300,
                        width: 300,
                        child: const Text(
                          'Pokemon sem foto',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20),
                        ),
                      )
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: loadImg(pokemon
                            .sprites!.other!.officialArtwork!.frontDefault
                            .toString()),
                      ),
              ),
              const SizedBox(width: 15),
              Divider(
                thickness: 2,
                height: 10,
              ),
              const SizedBox(width: 15),
              Column(
                children: [
                  Row(
                    children: [Text('Name: ${pokemon.name}')],
                  ),
                  Row(
                    children: [Text('Altura: ${pokemon.height}')],
                  ),
                  Text('Peso: ${pokemon.weight}'),

                  
                   if (pokemon.abilities != null)
                   Text('Abilidades'),
                  for (var i = 0; i < pokemon.abilities!.length; i++ )
                  Text('${pokemon.abilities![i].ability!.name.toString()}'),

          
               
               
                  
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget loadImg(String url) {
  return Container(
    color: Color.fromARGB(255, 125, 245, 129),
    child: Align(
      alignment: Alignment.center,
      child: ClipRRect(
        //borderRadius: BorderRadius.circular(200),
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
          height: 250,
          width: 250,
          fit: BoxFit.cover,
        ),
      ),
    ),
  );
}
