class Libro {
 

  Libro({
    required this.idLibro,
    required this.titulo,
    required this.autor,
    this.ano = 0,
    this.editorial = '',
    this.resumen = '',
    this.otroTitulo = "",
    this.cdd = "",
    this.isbn = "",
    this.tipoMaterial = "",
  });
  int idLibro;
  String titulo;
  String autor;
  int ano = 0;
  String editorial = '';
  String resumen = '';
  String otroTitulo = "string";
  String cdd = "string";
  String isbn = "string";
  String tipoMaterial = "Novela";

  factory Libro.fromJson(dynamic json) {
    return Libro(
      idLibro: json['idLibro'],
      titulo: json['titulo'],
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
