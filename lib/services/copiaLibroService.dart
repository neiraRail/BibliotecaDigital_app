import 'dart:convert';

import 'package:bib_digitalapp/modelo/copiaLibro.dart';
import 'package:bib_digitalapp/modelo/libro.dart';
import 'package:http/http.dart' as http;

import '../modelo/globalData.dart';

class CopiaLibroService {
  static Future<CopiaLibro?> getCopiaLibro(int id) async {
    var client = http.Client();
    var uri = Uri.http("200.13.5.14:7102", "/api/copiaLibro/" + id.toString(),
        {'q': '{http}'});
    var response = await client.get(uri, headers: {
      'Authorization': 'Bearer ' + GlobalData.token.toString(),
      "Access-Control-Allow-Origin": "*"
    });
    if (response.statusCode == 200) {
      var json = response.body;
      return copiaLibroFromJson(json);
    }
    return null;
  }

  static Future<List<CopiaLibro>> buscarCopias(Libro libro) async {
    final response = await http.get(
        Uri.http(
            "200.13.5.14:7102",
            "api/reserva/librosDisponibles/" + libro.idLibro.toString(),
            {'q': '{http}'}),
        headers: {
          'Authorization': 'Bearer ' + GlobalData.token.toString(),
          "Access-Control-Allow-Origin": "*"
        });
    if (response.statusCode == 200) {
      Iterable l = json.decode(response.body);
      List<CopiaLibro> copias =
          List<CopiaLibro>.from(l.map((model) => CopiaLibro.fromJson(model)));
      print(copias[0].idEspecifico);
      return copias;
    } else {
      return [];
    }
  }
}
