
import 'package:bib_digitalapp/modelo/libro.dart';
import 'package:http/http.dart' as http;

class LibroService {
  static Future<Libro?> getLibro() async {
    var client = http.Client();
    var uri = Uri.http("200.13.5.14:7102", "/api/libro/", {'q': '{http}'});
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return libroFromJson(json);
    }
    return null;
  }
  static Future<List<Libro>?> getLibros() async {
    var client = http.Client();
    var uri = Uri.http("200.13.5.14:7102", "/api/libro/", {'q': '{http}'});
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return librosFromJson(json);
    }
    return null;
  }
  static Future<List<Libro>?> buscarPalabra(String palabra) async {
    var client = http.Client();
    var uri = Uri.http("200.13.5.14:7102", "/api/libro/busqueda/"+palabra, {'q': '{http}'});
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return librosFromJson(json);
    }
    return null;
  }
}
