import 'package:get/get.dart';
import 'package:pokedex/core/models/data_page_model.dart';
import 'package:pokedex/modules/common/repositories/repository_pokemon.dart';

class ControllerPokemon extends GetxController {
  String? url;

  ControllerPokemon({this.url});

  final Rx<DataPageModel> dataPage = DataPageModel().obs;
  final RepositoryPokemon repositoryPokemon = RepositoryPokemon();
  RxBool isLoading = true.obs;

  getPokemons({String? url}) async {
    dataPage.value = await repositoryPokemon.getAllPokemons(url: url);

    isLoading.value = false;

    update();
  }
}
