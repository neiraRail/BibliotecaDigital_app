// To parse this JSON data, do
//
//     final postLogin = postLoginFromJson(jsonString);

import 'dart:convert';

PostLogin postLoginFromJson(String str) => PostLogin.fromJson(json.decode(str));

String postLoginToJson(PostLogin data) => json.encode(data.toJson());

class PostLogin {
  PostLogin({
    required this.email,
    required this.contrasena,
  });

  String email;
  String contrasena;

  factory PostLogin.fromJson(Map<String, dynamic> json) => PostLogin(
        email: json["email"],
        contrasena: json["contrasena"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "contrasena": contrasena,
      };
}
