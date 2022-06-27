import 'package:http/http.dart' as http;
import 'package:cross_file/cross_file.dart';

class ArchivoService {
  static void enviar(XFile file) async {
    var client = http.Client();

    print("Path: ");
    print(file.readAsString());
    var uri = Uri.http("localhost:5102", "/api/archivos/", {'q': '{http}'});
    var request = http.MultipartRequest('POST', uri);
    //request.files.add(http.MultipartFile.fromBytes('file', bytes));
    request.files.add(await http.MultipartFile.fromPath('file', file.path));
    request.headers["Access-Control-Allow-Origin"] = "*";
    var res = await request.send();

    if (res.statusCode == 200) {
      print("Todo bien :)");
      print(await res.stream.bytesToString());
    } else {
      print("El servidor mandó un status code distinto de 200:C --->");
      print(res.statusCode);
      print(await res.stream.bytesToString());
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

    return null;
  }
}
