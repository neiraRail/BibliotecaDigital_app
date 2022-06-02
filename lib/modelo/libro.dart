class Libro {
  int idLibro;
  String titulo = '';
  String autor = '';
  int ano = 0;
  String editorial = '';

  Libro(
      {this.idLibro = 0,
      this.titulo = '',
      this.autor = '',
      this.ano = 0,
      this.editorial = ''});

  factory Libro.fromJson(dynamic json) {
    return Libro(
        idLibro: json['idLibro'],
        titulo: json['nombre'],
        autor: json['autor'],
        ano: json['ano'],
        editorial: json['editorial']);
  }
}
