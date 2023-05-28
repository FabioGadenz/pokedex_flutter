// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:pokedex/core/models/pokemon_model.dart';

class DataPageModel {
  int? count;
  String? next;
  String? previous;
  List<Results>? results;
  List<PokemonModel>? pokemons;

  DataPageModel({
    this.count,
    this.next,
    this.previous,
    this.results,
    this.pokemons,
  });

  DataPageModel.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    next = json['next'];
    previous = json['previous'];
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(new Results.fromJson(v));
      });
    }
    if (json['pokemons'] != null) {
      pokemons = <PokemonModel>[];
      json['pokemons'].forEach((v) {
        pokemons!.add(PokemonModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    data['next'] = this.next;
    data['previous'] = this.previous;
    if (this.results != null) {
      data['results'] = this.results!.map((v) => v.toJson()).toList();
    }
    if (this.pokemons != null) {
      data['pokemons'] = this.pokemons!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  String toString() {
    return 'DataPage(count: $count, next: $next, previous: $previous, results: $results, pokemons: $pokemons)';
  }
}

class Results {
  String? name;
  String? url;

  Results({this.name, this.url});

  Results.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['url'] = this.url;
    return data;
  }
}
