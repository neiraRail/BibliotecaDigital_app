import 'package:bib_digitalapp/base_app_bar.dart';
import 'package:bib_digitalapp/buscador.dart';
import 'package:bib_digitalapp/historial.dart';
import 'package:bib_digitalapp/web/buscador.dart';
import 'package:bib_digitalapp/web/historialWeb.dart';
import 'package:bib_digitalapp/web/subida_manual.dart';
import 'package:flutter/material.dart';

class botombar extends StatefulWidget {
  const botombar({Key? key}) : super(key: key);

  @override
  State<botombar> createState() => _botombarState();
}

class _botombarState extends State<botombar> {
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
      /*appBar: BaseAppBar(title: const Text('Buscador'), appBar: AppBar()),
        body: const Center(
        child: Text('My Page!'),
      ),*/
        drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: const Text('Item 1'),
              
              onTap: () {
                
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
                Navigator.pushNamed(context, 'buscador');

              },
            ),
            ListTile(
              title: const Text('Item 2'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
          ],
        ))
    );
  }
}