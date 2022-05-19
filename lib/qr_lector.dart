import 'package:bib_digitalapp/base_app_bar.dart';
import 'package:flutter/material.dart';

class VistaLectorQR extends StatefulWidget {
  const VistaLectorQR({Key? key}) : super(key: key);

  @override
  State<VistaLectorQR> createState() => _VistaLectorQRState();
}

class _VistaLectorQRState extends State<VistaLectorQR> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: const Text("Lector QR"),
        appBar: AppBar(),
      ),
    );
  }
}
