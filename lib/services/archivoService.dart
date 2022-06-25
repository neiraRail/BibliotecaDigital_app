import 'package:http/http.dart' as http;

import '../modelo/file_DataModel.dart';

class ArchivoService {
  static void enviar(File_Data_Model? file) async {
    var client = http.Client();

    var uri = Uri.http("localhost:7102", "/api/libro/", {'q': '{http}'});
    var request = http.MultipartRequest('POST', uri);
    var bytes = await file!.stream.single;
    request.files.add(http.MultipartFile.fromBytes('file', bytes));
    request.headers["Access-Control-Allow-Origin"] = "*";
    var res = await request.send();

    if (res.statusCode == 200) {
      print("Todo bien :)");
    } else {
      print("Todo maaal:C");
    }
    return null;
  }
}
