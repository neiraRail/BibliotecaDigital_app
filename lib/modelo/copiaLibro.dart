class CopiaLibro {
  int idEspecifico;
  String estado = '';
  int idLibro;

  CopiaLibro({
    this.idEspecifico = 0,
    this.estado = '',
    this.idLibro = 0,
  });

  factory CopiaLibro.fromJson(dynamic json) {
    return CopiaLibro(
      idEspecifico: json['idEspecifico'],
      estado: json['estado'],
      idLibro: json['idLibro'],
    );
  }
}
