class PokemonModel {
  List<Abilities>? abilities;

  int? height;
  int? id;
  String? name;
  int? order;
  Ability? species;
  Sprites? sprites;
  List<Stats>? stats;
  List<Types>? types;
  int? weight;

  PokemonModel(
      {this.abilities,
      this.height,
      this.id,
      this.name,
      this.order,
      this.species,
      this.sprites,
      this.stats,
      this.types,
      this.weight});

  PokemonModel.fromJson(Map<String, dynamic> json) {
    if (json['abilities'] != null) {
      abilities = <Abilities>[];
      json['abilities'].forEach((v) {
        abilities!.add(Abilities.fromJson(v));
      });
    }

    id = json['id'];
    height = json['height'];

    name = json['name'];
    order = json['order'];

    species =
        json['species'] != null ? Ability.fromJson(json['species']) : null;
    sprites =
        json['sprites'] != null ? Sprites.fromJson(json['sprites']) : null;
    if (json['stats'] != null) {
      stats = <Stats>[];
      json['stats'].forEach((v) {
        stats!.add(Stats.fromJson(v));
      });
    }
    if (json['types'] != null) {
      types = <Types>[];
      json['types'].forEach((v) {
        types!.add(Types.fromJson(v));
      });
    }
    weight = json['weight'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (abilities != null) {
      data['abilities'] = abilities!.map((v) => v.toJson()).toList();
    }

    data['id'] = id;
    data['height'] = height;
    data['name'] = name;
    data['order'] = order;

    if (species != null) {
      data['species'] = species!.toJson();
    }
    if (sprites != null) {
      data['sprites'] = sprites!.toJson();
    }
    if (stats != null) {
      data['stats'] = stats!.map((v) => v.toJson()).toList();
    }
    if (types != null) {
      data['types'] = types!.map((v) => v.toJson()).toList();
    }
    data['weight'] = weight;
    return data;
  }
}

class Abilities {
  Ability? ability;
  bool? isHidden;
  int? slot;

  Abilities({this.ability, this.isHidden, this.slot});

  Abilities.fromJson(Map<String, dynamic> json) {
    ability =
        json['ability'] != null ? Ability.fromJson(json['ability']) : null;
    isHidden = json['is_hidden'];
    slot = json['slot'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (ability != null) {
      data['ability'] = ability!.toJson();
    }
    data['is_hidden'] = isHidden;
    data['slot'] = slot;
    return data;
  }
}

class Ability {
  String? name;
  String? url;

  Ability({this.name, this.url});

  Ability.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['name'] = name;
    data['url'] = url;
    return data;
  }
}

class Sprites {
  String? frontDefault;
  String? frontFemale;

  Other? other;

  Sprites({
    this.frontDefault,
    this.frontFemale,
    this.other,
  });

  Sprites.fromJson(Map<String, dynamic> json) {
    frontDefault = json['front_default'];
    frontFemale = json['front_female'];

    other = json['other'] != null ? Other.fromJson(json['other']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();

    data['front_default'] = frontDefault;
    data['front_female'] = frontFemale;

    if (other != null) {
      data['other'] = other!.toJson();
    }

    return data;
  }
}

class Other {
  DreamWorld? dreamWorld;
  Home? home;
  OfficialArtwork? officialArtwork;

  Other({this.dreamWorld, this.home, this.officialArtwork});

  Other.fromJson(Map<String, dynamic> json) {
    dreamWorld = json['dream_world'] != null
        ? DreamWorld.fromJson(json['dream_world'])
        : null;
    home = json['home'] != null ? Home.fromJson(json['home']) : null;
    officialArtwork = json['official-artwork'] != null
        ? OfficialArtwork.fromJson(json['official-artwork'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (dreamWorld != null) {
      data['dream_world'] = dreamWorld!.toJson();
    }
    if (home != null) {
      data['home'] = home!.toJson();
    }
    if (officialArtwork != null) {
      data['official-artwork'] = officialArtwork!.toJson();
    }
    return data;
  }
}

class DreamWorld {
  String? frontDefault;
  String? frontFemale;

  DreamWorld({this.frontDefault, this.frontFemale});

  DreamWorld.fromJson(Map<String, dynamic> json) {
    frontDefault = json['front_default'];
    frontFemale = json['front_female'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['front_default'] = frontDefault;
    data['front_female'] = frontFemale;
    return data;
  }
}

class Home {
  String? frontDefault;
  String? frontFemale;

  Home({
    this.frontDefault,
    this.frontFemale,
  });

  Home.fromJson(Map<String, dynamic> json) {
    frontDefault = json['front_default'];
    frontFemale = json['front_female'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['front_default'] = frontDefault;
    data['front_female'] = frontFemale;

    return data;
  }
}

class OfficialArtwork {
  String? frontDefault;

  OfficialArtwork({
    this.frontDefault,
  });

  OfficialArtwork.fromJson(Map<String, dynamic> json) {
    frontDefault = json['front_default'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['front_default'] = frontDefault;

    return data;
  }
}

class Stats {
  int? baseStat;
  int? effort;
  Ability? stat;

  Stats({this.baseStat, this.effort, this.stat});

  Stats.fromJson(Map<String, dynamic> json) {
    baseStat = json['base_stat'];
    effort = json['effort'];
    stat = json['stat'] != null ? Ability.fromJson(json['stat']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['base_stat'] = baseStat;
    data['effort'] = effort;
    if (stat != null) {
      data['stat'] = stat!.toJson();
    }
    return data;
  }
}

class Types {
  int? slot;
  Ability? type;

  Types({this.slot, this.type});

  Types.fromJson(Map<String, dynamic> json) {
    slot = json['slot'];
    type = json['type'] != null ? Ability.fromJson(json['type']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['slot'] = slot;
    if (type != null) {
      data['type'] = type!.toJson();
    }
    return data;
  }
}
