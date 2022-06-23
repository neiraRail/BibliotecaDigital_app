import 'package:http/http.dart' as http;
import '../modelo/reserva.dart';

class ReservaService {
  static Future<Reserva?> getReservaPorId(int idreserva) async {
    var client = http.Client();

    // final response = await http.get(Uri.http(
    //     "200.13.5.14:7102", "/api/Libro/busqueda/" + palabra, {'q': '{http}'}));

    // var uri = Uri.parse('http://http://200.13.5.14:7102/api/reserva/');
    var uri = Uri.http("200.13.5.14:7102",
        "/api/reserva/" + idreserva.toString(), {'q': '{http}'});
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return reservaFromJson(json);
    }
    return null;
  }
   static Future<List<Reserva>?> getReservas(int id) async {
    var client = http.Client();

    // final response = await http.get(Uri.http(
    //     "200.13.5.14:7102", "/api/Libro/busqueda/" + palabra, {'q': '{http}'}));

    // var uri = Uri.parse('http://http://200.13.5.14:7102/api/prestamo/');
    var uri = Uri.http("200.13.5.14:7102", "/api/reserva/"+ id.toString(), {'q': '{http}'});
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return reservasFromJson(json);
    }
    return null;
  }

}
