class PokemonModel {
  int? height;
  int? id;
  String? name;
  List<Types>? types;
  Sprites? sprites;

  PokemonModel({this.height, this.id, this.name, this.types, this.sprites});

  PokemonModel.fromJson(Map<String, dynamic> json) {
    height = json['height'];
    id = json['id'];
    name= json['name'];
    if (json['types'] != null) {
      types = <Types>[];
      json['types'].forEach((v) {
        types!.add( Types.fromJson(v));
      });
    }
    sprites =
        json['sprites'] != null ?  Sprites.fromJson(json['sprites']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['height'] = this.height;
    data['id'] = this.id;
    data['name'] = this.name;
    if (this.types != null) {
      data['types'] = this.types!.map((v) => v.toJson()).toList();
    }
    if (this.sprites != null) {
      data['sprites'] = this.sprites!.toJson();
    }
    return data;
  }
}

class Types {
  int? slot;
  Type? type;

  Types({this.slot, this.type});

  Types.fromJson(Map<String, dynamic> json) {
    slot = json['slot'];
    type = json['type'] != null ?  Type.fromJson(json['type']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['slot'] = this.slot;
    if (this.type != null) {
      data['type'] = this.type!.toJson();
    }
    return data;
  }
}

class Type {
  String? name;
  String? url;

  Type({this.name, this.url});

  Type.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['name'] = this.name;
    data['url'] = this.url;
    return data;
  }
}

class Sprites {
  String? frontDefault;
  String? frontFemale;
  Other? other;

  Sprites({this.frontDefault, this.frontFemale, this.other});

  Sprites.fromJson(Map<String, dynamic> json) {
    frontDefault = json['front_default'];
    frontFemale = json['front_female'];
    other = json['other'] != null ?  Other.fromJson(json['other']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['front_default'] = this.frontDefault;
    data['front_female'] = this.frontFemale;
    if (this.other != null) {
      data['other'] = this.other!.toJson();
    }
    return data;
  }
}

class Other {
  DreamWorld? dreamWorld;

  Other({this.dreamWorld});

  Other.fromJson(Map<String, dynamic> json) {
    dreamWorld = json['dream_world'] != null
        ? new DreamWorld.fromJson(json['dream_world'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    if (this.dreamWorld != null) {
      data['dream_world'] = this.dreamWorld!.toJson();
    }
    return data;
  }
}

class DreamWorld {
  String? frontDefault;
  Null? frontFemale;

  DreamWorld({this.frontDefault, this.frontFemale});

  DreamWorld.fromJson(Map<String, dynamic> json) {
    frontDefault = json['front_default'];
    frontFemale = json['front_female'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['front_default'] = this.frontDefault;
    data['front_female'] = this.frontFemale;
    return data;
  }
}
