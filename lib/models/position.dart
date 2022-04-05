class Position {
  final double latitude, longitude;

  const Position(this.latitude, this.longitude);

  factory Position.fromJson(Map<String, dynamic> json) {
    return Position(json["latitude"], json["longitude"]);
  }
}
