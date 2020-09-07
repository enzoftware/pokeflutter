class PokemonDetail {
  int id;
  int height;
  int baseExperience;
  int weight;
  List<PokemonType> types;

  PokemonDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    height = json['height'];
    baseExperience = json['base_experience'];
    weight = json['weight'];
    types = [for (var t in json['types']) PokemonType.fromJson(t)];
  }
}

class PokemonType {
  String name;
  PokemonType.fromJson(Map<String, dynamic> json) {
    name = json['type']['name'];
  }
}
