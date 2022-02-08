import 'package:envairo/models/position.dart';

class User{
  final String email;
  final String username, name;
  final String? surname;

  final Position? position;

  const User({
    required this.email,
    required this.username,
    required this.name,
    this.surname,
    this.position
  });

  factory User.fromJson(Map<String, dynamic> json){
    return User(
      email: json['email'],
      username: json['username'],
      name: json['name'],
      surname: json['surname'],
      position: Position.fromJson(json['position']),
    );
  }
}