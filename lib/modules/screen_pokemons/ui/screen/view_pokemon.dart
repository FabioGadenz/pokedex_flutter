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
                          height: 369,
                          width: 292,
                          child: const Text(
                            'Pokemon sem foto',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 20),
                          ),
                        )
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: loadImg(
                              pokemon.sprites!.frontDefault.toString()),
                        ),
                ),
                  Divider(
                thickness: 2,
                height: 10,
              ), 
                const SizedBox(width: 40), 
            ],
          ),
        ),
      ),
    );
  }
}

Widget loadImg(String url) {
  return Align(
          alignment: Alignment.center,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(200),
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
              height: 126,
              width: 126,
              fit: BoxFit.cover,
            ),
          ),
        );
    
  
}
