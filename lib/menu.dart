import 'package:bib_digitalapp/base_app_bar.dart';
import 'package:bib_digitalapp/modelo/globalData.dart';
import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  final Color backgroundColor = Colors.white;
  //final Text title;
  //final AppBar appBar;

  // ignore: use_key_in_widget_constructors
  /// you can add more fields that meet your needs

  @override
  Widget build(BuildContext context) {
    if (GlobalData.type == 'alumno') {
      return Drawer(
          // Add a ListView to the drawer. This ensures the user can scroll
          // through the options in the drawer if there isn't enough vertical
          // space to fit everything.
          child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.grey,
              ),
              child: Text('Menu Alumno')
              // child: Image(image: AssetImage('assets/images/logo.png') ),

              ),
          ListTile(
            title: const Text('Buscador'),
            leading: Icon(Icons.content_paste_search),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, 'buscador');
            },
          ),
          ListTile(
            title: const Text('Mi historial'),
            leading: Icon(Icons.collections_bookmark),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, 'historial');
            },
          ),
        ],
      ));
    }
    if (GlobalData.type == 'bibliotecario') {
      return Drawer(
          // Add a ListView to the drawer. This ensures the user can scroll
          // through the options in the drawer if there isn't enough vertical
          // space to fit everything.
          child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.grey,
              ),
              child: Text('Menu Bibliotecario')
              // child: Image(image: AssetImage('assets/images/logo.png') ),

              ),
          ListTile(
            title: const Text('Agregar un libro'),
            leading: Icon(Icons.fiber_new),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, 'subidaManual');
            },
          ),
          ListTile(
            title: const Text('Carga masiva'),
            leading: Icon(Icons.cloud_upload_outlined),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, 'carga');
            },
          ),
          ListTile(
            title: const Text('Historial de Pedidos'),
            leading: Icon(Icons.history),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, 'historialWeb');
            },
          ),
          ListTile(
            title: const Text('Buscador'),
            leading: Icon(Icons.manage_search),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, 'buscadorWeb');
            },
          ),
        ],
      ));
    }
    if (GlobalData.type == 'bibliotecario') {
      return Drawer(
          // Add a ListView to the drawer. This ensures the user can scroll
          // through the options in the drawer if there isn't enough vertical
          // space to fit everything.
          child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.grey,
              ),
              child: Text('Menu Admin')
              // child: Image(image: AssetImage('assets/images/logo.png') ),

              ),
          ListTile(
            title: const Text('lector Qr'),
            leading: Icon(Icons.qr_code_scanner),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, 'lector');
            },
          ),
          ListTile(
            title: const Text('Agregar un libro'),
            leading: Icon(Icons.fiber_new),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, 'subidaManual');
            },
          ),
          ListTile(
            title: const Text('Carga masiva'),
            leading: Icon(Icons.cloud_upload_outlined),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, 'carga');
            },
          ),
          ListTile(
            title: const Text('Historial de Pedidos'),
            leading: Icon(Icons.history),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, 'historialWeb');
            },
          ),
          ListTile(
            title: const Text('Buscador'),
            leading: Icon(Icons.manage_search),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, 'buscadorWeb');
            },
          ),
        ],
      ));
    } else {
      return Drawer();
    }

    // appBar: BaseAppBar(title: const Text('Buscador'), appBar: AppBar()),
  }
}
