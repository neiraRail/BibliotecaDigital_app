import 'package:http/http.dart' as http;
import '../modelo/reserva.dart';

class ReservaService {
  static Future<List< Reserva>?> get Reservas() async {
    var client = http.Client();

    // final response = await http.get(Uri.http(
    //     "200.13.5.14:7102", "/api/Libro/busqueda/" + palabra, {'q': '{http}'}));

    // var uri = Uri.parse('http://http://200.13.5.14:7102/api/reserva/');
    var uri = Uri.http("200.13.5.14:7102",
        "/api/reserva/historial/" + alumno.toString(), {'q': '{http}'});
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return reservaFromJson(json);
    }
    return null;
  }

  static Future<List<Reserva>?> getReservas() async {
    var client = http.Client();

    // final response = await http.get(Uri.http(
    //     "200.13.5.14:7102", "/api/Libro/busqueda/" + palabra, {'q': '{http}'}));

    // var uri = Uri.parse('http://http://200.13.5.14:7102/api/reserva/');
    var uri = Uri.http("200.13.5.14:7102", "/api/reserva/", {'q': '{http}'});
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return reservaFromJson(json);
    }
    return null;
  }
}
