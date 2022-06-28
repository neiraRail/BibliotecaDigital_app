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
    var response =
        await client.get(uri, headers: {"Access-Control-Allow-Origin": "*"});
    if (response.statusCode == 200) {
      var json = response.body;
      return librosFromJson(json);
    }
    return null;
  }

  static Future<Libro?> postLibro(Libro libro) async {
    var client = http.Client();

    var uri = Uri.http("200.13.5.14:7102", "/api/libro/", {'q': '{http}'});
    var response = await client.post(uri, body: libroToJson(libro), headers: {
      "Content-Type": "application/json",
      "Accept": "application/json",
      "Access-Control-Allow-Origin": "*"
    });
    if (response.statusCode == 200) {
      var json = response.body;
      return libroFromJson(json);
    } else {
      print(response.body);
    }
  }

  static Future<bool> putLibro(Libro libro) async {
    var client = http.Client();
    var uri = Uri.http("200.13.5.14:7102",
        "/api/libro/" + libro.idLibro.toString(), {'q': '{http}'});
    libro.idLibro = null;
    var response = await client.put(uri, body: libroToJson(libro), headers: {
      "Content-Type": "application/json",
      "Accept": "application/json",
      "Access-Control-Allow-Origin": "*"
    });
    if (response.statusCode == 204) {
      return true;
    } else {
      print("Hubo algo raro");
      print(response.reasonPhrase);
      return false;
    }
  }

  static Future<List<Libro>?> buscarPalabra(String palabra) async {
    var client = http.Client();
    var uri = Uri.http(
        "200.13.5.14:7102", "/api/libro/busqueda/" + palabra, {'q': '{http}'});
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return librosFromJson(json);
    }
    return null;
  }
}
