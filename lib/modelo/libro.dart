class Libro {
  int idLibro;
  String titulo = '';
  String autor = '';
  int ano = 0;
  String editorial = '';
  String resumen = '';
  String otroTitulo = "string";
  String cdd = "string";
  String isbn = "string";
  String tipoMaterial = "Novela";

  Libro({
    this.idLibro = 0,
    this.titulo = '',
    this.autor = '',
    this.ano = 0,
    this.editorial = '',
    this.resumen = '',
    this.otroTitulo = "",
    this.cdd = "",
    this.isbn = "",
    this.tipoMaterial = "",
  });

  factory Libro.fromJson(dynamic json) {
    return Libro(
      idLibro: json['idLibro'],
      titulo: json['nombre'],
      autor: json['autor'],
      ano: json['ano'],
      editorial: json['editorial'],
      resumen: json['resumen'],
      otroTitulo: json['otroTitulo'],
      cdd: json["cdd"],
      isbn: json["isbn"],
      tipoMaterial: json["tipoMaterial"],
    );
  }
}
