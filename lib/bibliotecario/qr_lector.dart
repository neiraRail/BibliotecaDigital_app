import 'package:bib_digitalapp/base_app_bar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../menu.dart';

class VistaLectorQR extends StatefulWidget {
  const VistaLectorQR({Key? key}) : super(key: key);

  @override
  State<VistaLectorQR> createState() => _VistaLectorQRState();
}

class _VistaLectorQRState extends State<VistaLectorQR> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;
  bool escaneado = false;

  @override
  void reassemble() {
    super.reassemble();
    controller!.pauseCamera();
  }

  @override
  void initState() {
    super.initState();
    escaneado = false;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: const Text("Lector QR"),
        appBar: AppBar(),
      ),
      drawer: Menu( ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 5,
            child: QRView(
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: (result != null)
                  ? Text(
                      'Barcode Type: ${describeEnum(result!.format)}   Data: ${result!.code}')
                  : Text('Scan a code'),
            ),
          )
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        print("Escaneado!!");
        if(!escaneado) {
          escaneado = true;
          result = scanData;
          print("Result: "+result.toString());
          Navigator.pushNamed(context, 'detalleReserva',
              arguments: int.parse(result!.code!));
        }
      });
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
