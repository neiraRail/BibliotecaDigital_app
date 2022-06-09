import 'package:bib_digitalapp/modelo/alumno.dart';

class Reserva {
  int IdReserva;
  int CopiaLibro =0;
  int Alumno = 0;
  String Fecha = '';

  Reserva(
      {this.IdReserva = 0,
      this.CopiaLibro = 0,
      this.Alumno = 0,
      this.Fecha = '2000-01-02 00:00:00'});

  factory Reserva.fromJson(dynamic json) {
    return Reserva(
        IdReserva: json['idLibro'],
        CopiaLibro: json['nombre'],
        Alumno: json['autor'],
        Fecha: json['ano']);
  }
}