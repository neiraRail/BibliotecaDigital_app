import 'package:bib_digitalapp/modelo/alumno.dart';
import 'package:http/http.dart' as http;

import '../modelo/globalData.dart';

class AlumnoService {
  static Future<List<Alumno>?> getAlumnos() async {
    var client = http.Client();
    var uri = Uri.http("200.13.5.14:7102", "/api/alumno/", {'q': '{http}'});
    var response = await client.get(uri, headers: {
      'Authorization': 'Bearer ' + GlobalData.token.toString(),
      "Access-Control-Allow-Origin": "*"
    });
    if (response.statusCode == 200) {
      var json = response.body;
      return alumnoFromJson(json);
    }
    return null;
  }
}
