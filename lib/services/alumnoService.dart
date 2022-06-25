import 'package:bib_digitalapp/modelo/alumno.dart';
import 'package:http/http.dart' as http;

class AlumnoService {
  static Future<List<Alumno>?> getAlumnos() async {
    var client = http.Client();

    // final response = await http.get(Uri.http(
    //     "200.13.5.14:7102", "/api/Libro/busqueda/" + palabra, {'q': '{http}'}));

    // var uri = Uri.parse('http://http://200.13.5.14:7102/api/prestamo/');
    var uri = Uri.http("200.13.5.14:7102", "/api/alumno/", {'q': '{http}'});
    var response =
        await client.get(uri, headers: {"Access-Control-Allow-Origin": "*"});
    if (response.statusCode == 200) {
      var json = response.body;
      return alumnoFromJson(json);
    }
    return null;
  }
}
