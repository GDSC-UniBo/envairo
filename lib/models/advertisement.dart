class Advertisement{
  //int variable, this can't be null (see below).
  // This ensure at compile time that we don't have to check id!=null
  //For more info, search "dart null safety", an amazing feature of dart
  final int id;

  //The question mark after the mean that this variable can be null
  //TODO Remove ?
  final String? description;

  //inside {}, we specify keyword arguments (non positional).
  // Usually these are optional, but id can't be null, so we can use required keyword
  //If not specified, description will be set to "", so we can make even it non-nullable.
  const Advertisement({
    required this.id,
    this.description = ""
  });

  //Factory method is a method to create an instance of this class.
  //Maybe we will fetch Advertisemtns from an API, so we get a JSON and we create the object with:
  //Advertisement my_adv = Advertisement.fromJson(json)
  factory Advertisement.fromJson(Map<String, dynamic> json){
    return Advertisement(
        id: json["id"],
        description: json["description"]
    );
  }
}