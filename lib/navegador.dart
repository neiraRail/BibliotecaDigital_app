import 'package:bib_digitalapp/base_app_bar.dart';
import 'package:bib_digitalapp/buscador.dart';
import 'package:bib_digitalapp/historial.dart';
import 'package:bib_digitalapp/web/buscador.dart';
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
      {'icon': Icons.abc, 'route': 'buscador'},
      {'icon': Icons.baby_changing_station, 'route': 'datos'},
      {'icon': Icons.cabin, 'route': 'historial'},
      {'icon': Icons.dangerous, 'route': 'reserva'},
      {'icon': Icons.e_mobiledata, 'route': 'lector'},
      {'icon': Icons.face, 'route': 'login'},
      {'icon': Icons.account_circle, 'route': 'buscadorWeb'},
      {'icon': Icons.account_balance_wallet, 'route': 'subidaManual'}
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
