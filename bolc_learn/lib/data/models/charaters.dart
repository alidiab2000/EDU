 class Character {
  Character({
    required this.id,
    required this.status,
    required this.created,
    required this.image,
    required this.gender,
    required this.name,
    required this.origin,
    required this.species,
    required this.type,
  });
  late int id;
  late String name;
  late String status;
  late String species;
  late String type;
  late String gender;
  late Origin origin;
  late String image;
  late DateTime created;
  factory Character.fromjson(Map<String, dynamic> json) {
    return Character(
      id: json['id'],
      name: json['name'],
      status: json['status'],
      species: json['species'],
      type: json['type'],
      gender: json['gender'],
      origin: Origin.formJson(json['origin']),
      image: json['image'],
      created: DateTime.tryParse(json['created']) ?? DateTime.now(),
    );
  }
}

class Origin {
  Origin({required this.name, required this.url});
  late String name;
  late String url;
  factory Origin.formJson(Map<String, dynamic> json) {
   return Origin (
      name : json['name'],
      url: json['url'],
    );
  }
}
