import 'package:http/http.dart' as http;
import 'package:cross_file/cross_file.dart';

class ArchivoService {
  static Future<String?> enviar(XFile file) async {
    var client = http.Client();

    var uri = Uri.http("200.13.5.14:7102", "/api/archivos/", {'q': '{http}'});
    var request = http.MultipartRequest('POST', uri);
    request.files.add(await http.MultipartFile.fromPath('file', file.path!));
    request.headers["Access-Control-Allow-Origin"] = "*";
    var res =
        await request.send().catchError((error) => throw Exception(error));

    if (res.statusCode == 200) {
      print("[Subit archivo] Todo bien :)");
      return await res.stream.bytesToString();
    } else {
      print(
          "[Subir archivo] El servidor mandó un status code distinto de 200:C --->");
      print(res.statusCode);
      return null;
    }

    // var response = await client.post(uri, body: , headers: {
    //   "Content-Type": "multipart/form-data",
    //   "Accept": "application/json",
    //   "Access-Control-Allow-Origin": "*"
    // });
    // if (response.statusCode == 200) {
    //   var json = response.body;
    //   print(json);
    // } else {
    //   print(response.body);
    // }
  }
}
