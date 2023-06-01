class Character {
  final String name;
  final String status;
  final String type;
  final String gender;
  final dynamic origin;
  final String imageUrl;
  final String species;
  



  Character({
    required this.name,
    required this.status,
    required this.type,
    required this.gender,
    required this.origin,
    required this.imageUrl,
    required this.species,
   
    
    

  });

  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
      name: json['name'],
      status: json['status'],
      type: json['type'],
      gender: json['gender'],
      origin: json['origin'],
      imageUrl: json['image'],
      species: json['species'],
    );
  }




}