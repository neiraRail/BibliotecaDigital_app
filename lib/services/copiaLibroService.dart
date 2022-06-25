
import 'package:bib_digitalapp/modelo/copiaLibro.dart';
import 'package:bib_digitalapp/modelo/libro.dart';
import 'package:http/http.dart' as http;

class CopiaLibroService {
  static Future<Libro?> getCopiaLibro(int id) async {
    var client = http.Client();
    var uri = Uri.http("200.13.5.14:7102", "/api/copiaLibro/"+id.toString(), {'q': '{http}'});
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return  copiaLibroFromJson(json);
    }
    return null;
  }

}
