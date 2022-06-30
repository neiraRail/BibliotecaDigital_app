import 'package:bib_digitalapp/base_app_bar.dart';
import 'package:bib_digitalapp/buscador.dart';
import 'package:bib_digitalapp/historial.dart';
import 'package:bib_digitalapp/web/buscador.dart';
import 'package:bib_digitalapp/web/historialWeb.dart';
import 'package:bib_digitalapp/web/subida_manual.dart';
import 'package:flutter/material.dart';

class VistaNavegador extends StatefulWidget {
  const VistaNavegador({Key? key}) : super(key: key);

  @override
  State<VistaNavegador> createState() => _VistaNavegadorState();
}

class _VistaNavegadorState extends State<VistaNavegador> {
  late List<Map<String, dynamic>> programmeList;

  @override
  void initState() {
    programmeList = [
      {'icon': Icons.content_paste_search, 'route': 'buscador'},
      {'icon': Icons.collections_bookmark, 'route': 'historial'},
      {'icon': Icons.qr_code_scanner, 'route': 'lector'},
      {'icon': Icons.fiber_new, 'route': 'subidaManual'},
      {'icon': Icons.cloud_upload_outlined, 'route': 'carga'},
      {'icon': Icons.history, 'route': 'historialWeb'},
      {'icon': Icons.manage_search, 'route': 'buscadorWeb'},
      // {'icon': Icons.emoji_nature, 'route': 'editar'},
      // {'icon': Icons.note, 'route': 'historialWeb'}
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: const Text("Navegador"),
        appBar: AppBar(),
      ),
      body: GridView.builder(
        shrinkWrap: true,
        itemCount: programmeList.length,
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 0.7,
        ),
        itemBuilder: (context, index) {
          return IconButton(
            onPressed: () {
              Navigator.pushReplacementNamed(
                  context, programmeList[index]['route']);
            },
            icon: Icon(programmeList[index]['icon']),
          );
        },
      ),
    );
  }

  void _navigateToNextScreen(BuildContext context, Function newScreen) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => newScreen()));
  }
}
