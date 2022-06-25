class File_Data_Model {
  final String name;
  final String mime;
  final int bytes;
  final String url;
  Stream<List<int>> stream;

  File_Data_Model(
      {required this.name,
      required this.mime,
      required this.bytes,
      required this.url,
      required this.stream});

  String get size {
    final kb = bytes / 1024;
    final mb = kb / 1024;

    return mb > 1
        ? '${mb.toStringAsFixed(2)} MB'
        : '${kb.toStringAsFixed(2)} KB';
  }
}
