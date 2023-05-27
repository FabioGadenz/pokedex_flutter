// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:pokedex/core/models/data_page_model.dart';
import 'package:http/http.dart' as http;
import 'package:pokedex/core/models/pokemon_model.dart';

class RepositoryPokemon {
 // int numero;

 /*  RepositoryPokemon({
    required this.numero,
  }); */

  //Future DataPageModel getgetAllPokemons()

   Future<List<PokemonModel>> getAllPokemons({required int page}) async {
    const qtdItems = 10;
    Uri urlPagePokemons = Uri.parse(
        'https://pokeapi.co/api/v2/pokemon?offset=0&limit=$qtdItems');
    List<PokemonModel> list = [];
    List urlPokemons = [];
    DataPageModel dataPageModel = DataPageModel();

    try {
      final response = await http.get(urlPagePokemons);
      final jsonPokemonsbyPg =
          jsonDecode(response.body) as Map<String, dynamic>;
      //final nrTotalPokemons = jsonPokemonsbyPg['count'] as int;

      urlPokemons.add(DataPageModel.fromJson(jsonPokemonsbyPg));
      dataPageModel = DataPageModel.fromJson(jsonPokemonsbyPg);

      for (var i = 0; i < 10; i++) {
        final response2 =
            await http.get(Uri.parse(dataPageModel.results![i].url.toString()));
        final responseData = jsonDecode(response2.body) as Map<String, dynamic>;
        list.add(PokemonModel.fromJson(responseData));
      }
      print(list.length);
      return list;
    } catch (e) {
      throw Exception('Erro ao carregar Informações');
    }
  } 
}
