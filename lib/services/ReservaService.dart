import 'package:http/http.dart' as http;
import '../modelo/globalData.dart';
import '../modelo/postReserva.dart';
import '../modelo/reserva.dart';

class ReservaService {
  static prestamofromReserva(int id) async {
    var client = http.Client();
    var uri = Uri.http(
        "200.13.5.14:7102", "/api/prestamo/" + id.toString(), {'q': '{http}'});

    var response = await client.post(uri, headers: {
      'Authorization': 'Bearer ' + GlobalData.token.toString(),
      "Access-Control-Allow-Origin": "*"
    });

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  static Future<Reserva?> getReservaPorId(int idreserva) async {
    var client = http.Client();
    print("ID OCUPADA: " + idreserva.toString());
    var uri = Uri.http("200.13.5.14:7102",
        "/api/reserva/" + idreserva.toString(), {'q': '{http}'});
    var response = await client.get(uri, headers: {
      'Authorization': 'Bearer ' + GlobalData.token.toString(),
      "Access-Control-Allow-Origin": "*"
    });
    print(response.body);
    if (response.statusCode == 200) {
      var json = response.body;
      return reservaFromJson(json);
    }
    else if(response.statusCode == 404){
      throw Exception("No encontrada");
    }else{
      print(response.statusCode);
      print(response.body);
      throw Exception(response.statusCode);
    }
    return null;
  }

  static Future<List<Reserva>?> getReservas(int id) async {
    var client = http.Client();

    var uri = Uri.http(
        "200.13.5.14:7102", "/api/reserva/" + id.toString(), {'q': '{http}'});
    var response = await client.get(uri, headers: {
      'Authorization': 'Bearer ' + GlobalData.token.toString(),
      "Access-Control-Allow-Origin": "*"
    });
    if (response.statusCode == 200) {
      var json = response.body;
      return reservasFromJson(json);
    }
    return null;
  }

  static Future<Reserva?> postReserva(PostReserva postreserva) async {
    var client = http.Client();

    var uri = Uri.http("200.13.5.14:7102", "/api/reserva/", {'q': '{http}'});
    var response =
        await client.post(uri, body: postReservaToJson(postreserva), headers: {
      'Authorization': 'Bearer ' + GlobalData.token.toString(),
      "Access-Control-Allow-Origin": "*",
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    });
    if (response.statusCode == 200) {
      var json = response.body;
      return reservaFromJson(json);
    } else {
      print(response.body);
    }
  }
}
