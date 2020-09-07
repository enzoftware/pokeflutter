class Pokemon {
  String name;
  String detailUrl;
  int id;

  Pokemon({this.name, this.detailUrl, this.id});

  String get image => 'https://pokeres.bastionbot.org/images/pokemon/$id.png';

  Pokemon.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    detailUrl = json['url'];
    id = int.parse(detailUrl.substring(34, detailUrl.length - 1));
  }
}
