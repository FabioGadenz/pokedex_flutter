/* import 'package:get/get.dart';
import 'package:pokedex/modules/home/ui/screen/main_home.dart';
import 'package:pokedex/modules/screen_pokemons/ui/screen/screen_all_pokemons.dart';
import 'package:pokedex/modules/screen_pokemons/ui/screen/view_pokemon.dart';

class RoutesApp {
  static const mainHome = '/mainHome';
  static const screenAllPokemons = '/screenAllPokemons';
  static const viewPokemon = '/viewPokemon';

  static List<GetPage> routes = [
      GetPage(
      name: mainHome,
      page: () => MainHome(repositoryPokemon: Get.find()),
    ), 
      GetPage(
      name: mainHome,
      page: () => ScreenAllPokemons(repositoryPokemon: Get.find(), data: Get.find(),),
    ), 
    GetPage(
      name: viewPokemon,
      page: () =>  ViewPokemon(),
    )
  ];
}
 */