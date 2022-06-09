class Alumno {
  int idAlumno;
  String Nombres = '';
  String Apellidos = '';
  String email = '';
  String contrasenia = '';
  String Estado = '';

  Alumno(
      {this.idAlumno = 0,
      this.Nombres = '',
      this.Apellidos = '',
      this.email = '',
      this.contrasenia = '',
      this.Estado = '',
      });

  factory Alumno.fromJson(dynamic json) {
    return Alumno(
        idAlumno: json['idAlumno'],
        Nombres: json['nombres'],
        Apellidos: json['apellidos'],
        email: json['email'],
        contrasenia: json['contrasenia'],
        Estado: json['estado']);
  }
}