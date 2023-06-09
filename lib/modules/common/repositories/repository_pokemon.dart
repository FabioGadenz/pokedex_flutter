import 'dart:convert';
import 'package:pokedex/core/models/data_page_model.dart';
import 'package:http/http.dart' as http;
import 'package:pokedex/core/models/pokemon_model.dart';

class RepositoryPokemon {
  Future<DataPageModel> getAllPokemons({String? url}) async {
    const qtdItems = 12;

    Uri urlPagePokemons = Uri.parse(
        url ?? 'https://pokeapi.co/api/v2/pokemon?offset=0&limit=$qtdItems');
    DataPageModel dataPage = DataPageModel();
    List<PokemonModel> pokemon = [];

    try {
      final response = await http.get(urlPagePokemons);
      final jsonPokemonsbyPg =
          jsonDecode(response.body) as Map<String, dynamic>;

      dataPage = DataPageModel.fromJson(jsonPokemonsbyPg);

      for (var i = 0; i < qtdItems; i++) {
        final response2 =
            await http.get(Uri.parse(dataPage.results![i].url.toString()));

        final responseDataPokemon =
            jsonDecode(response2.body) as Map<String, dynamic>;
        pokemon.add(PokemonModel.fromJson(responseDataPokemon));
      }
      dataPage.pokemons = pokemon;

      return dataPage;
    } catch (e) {
      print('Erro ao carregar Informações!');
      return dataPage;
    }
  }
}
