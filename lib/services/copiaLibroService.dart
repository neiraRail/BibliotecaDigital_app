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

      return copias;
    } else {
      return [];
    }
  }

  static Future<bool> deleteLibro(CopiaLibro libro) async {
    var client = http.Client();
    print("eliminar copia libro: " + libro.idEspecifico.toString());
    var uri = Uri.http("200.13.5.14:7102",
        "/api/copialibro/" + libro.idEspecifico.toString(), {'q': '{http}'});
    var response = await client.delete(uri, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ' + GlobalData.token,
    });

    print(response.body);
    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception(response.body);
    }
  }
}
