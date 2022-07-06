import 'dart:convert';

import 'package:bib_digitalapp/modelo/postLogin.dart';
import 'package:http/http.dart' as http;

class LoginService {
  static Future<List<String>?> loginAlumno(PostLogin credenciales) async {
    var client = http.Client();
    var uri =
        Uri.http("200.13.5.14:7102", "/api/auth/loginalumno", {'q': '{http}'});
    var response =
        await client.post(uri, body: postLoginToJson(credenciales), headers: {
      "Content-Type": "application/json",
      "Accept": "application/json",
      "Access-Control-Allow-Origin": "*"
    });
    if (response.statusCode == 200) {
      var json = response.body;
      return jsonDecode(json);
    } else {
      throw Exception(response.body);
    }
  }

  static Future<List<String>?> loginBibliotecario(
      PostLogin credenciales) async {
    var client = http.Client();
    var uri = Uri.http(
        "200.13.5.14:7102", "/api/auth/loginbibliotecario", {'q': '{http}'});
    var response =
        await client.post(uri, body: postLoginToJson(credenciales), headers: {
      "Content-Type": "application/json",
      "Accept": "application/json",
      "Access-Control-Allow-Origin": "*"
    });
    if (response.statusCode == 200) {
      var json = response.body;
      return jsonDecode(json);
    } else {
      throw Exception(response.body);
    }
  }

  static Future<List<String>?> loginAdmin(PostLogin credenciales) async {
    var client = http.Client();
    var uri =
        Uri.http("200.13.5.14:7102", "/api/auth/loginadmin", {'q': '{http}'});
    var response =
        await client.post(uri, body: postLoginToJson(credenciales), headers: {
      "Content-Type": "application/json",
      "Accept": "application/json",
      "Access-Control-Allow-Origin": "*"
    });
    if (response.statusCode == 200) {
      var json = response.body;
      return jsonDecode(json);
    } else {
      throw Exception(response.body);
    }
  }
}
