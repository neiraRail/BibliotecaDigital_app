// To parse this JSON data, do
//
//     final alumno = alumnoFromJson(jsonString);

import 'dart:convert';

List<Alumno> alumnosFromJson(String str) =>
    List<Alumno>.from(json.decode(str).map((x) => Alumno.fromJson(x)));

Alumno alumnoFromJson(String str){

  return Alumno.fromJson(jsonDecode(str));
}
    

String alumnoToJson(List<Alumno> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Alumno {
  Alumno({
    required this.idAlumno,
    required this.run,
    required this.nombres,
    required this.apellidos,
    required this.email,
    //othis.contrasena='',
  });

  int idAlumno;
  String run;
  String nombres;
  String apellidos;
  String email;
  //String contrasena='';

  factory Alumno.fromJson(Map<String, dynamic> json) => Alumno(
        idAlumno: json["idAlumno"],
        run: json["run"],
        nombres: json["nombres"],
        apellidos: json["apellidos"],
        email: json["email"],
        //contrasena: json["contrasena"],
      );

  Map<String, dynamic> toJson() => {
        "idAlumno": idAlumno,
        "run": run,
        "nombres": nombres,
        "apellidos": apellidos,
        "email": email,
        //"contrasena": contrasena,
      };
}
