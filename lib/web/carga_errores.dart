import 'package:flutter/material.dart';

class CargaErrores extends StatelessWidget {
  const CargaErrores({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final errores = ModalRoute.of(context)!.settings.arguments as List<String>;
    return Center(
      child: Text(errores.length.toString()),
    );
  }
}
