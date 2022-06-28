import 'package:http/http.dart' as http;
import '../modelo/prestamo.dart';

class PrestamoService {
  static Future<List<Prestamo>?> getPrestamosPorAlumno(int alumno) async {
    var client = http.Client();

    // final response = await http.get(Uri.http(
    //     "200.13.5.14:7102", "/api/Libro/busqueda/" + palabra, {'q': '{http}'}));

    // var uri = Uri.parse('http://http://200.13.5.14:7102/api/prestamo/');
    var uri = Uri.http("200.13.5.14:7102",
        "/api/prestamo/historial/" + alumno.toString(), {'q': '{http}'});
    var response =
        await client.get(uri, headers: {"Access-Control-Allow-Origin": "*"});
    if (response.statusCode == 200) {
      var json = response.body;
      return prestamoFromJson(json);
    }
    return null;
  }

  static Future<List<Prestamo>?> getPrestamos() async {
    var client = http.Client();

    // final response = await http.get(Uri.http(
    //     "200.13.5.14:7102", "/api/Libro/busqueda/" + palabra, {'q': '{http}'}));

    // var uri = Uri.parse('http://http://200.13.5.14:7102/api/prestamo/');
    var uri = Uri.http("200.13.5.14:7102", "/api/prestamo/", {'q': '{http}'});
    var response =
        await client.get(uri, headers: {"Access-Control-Allow-Origin": "*"});
    if (response.statusCode == 200) {
      var json = response.body;
      return prestamoFromJson(json);
    }
    return null;
  }
}
