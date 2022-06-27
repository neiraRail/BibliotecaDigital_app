import 'dart:async';

import 'package:bib_digitalapp/base_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:bib_digitalapp/services/libroService.dart';

import '../modelo/libro.dart';

class subidaManual extends StatefulWidget {
  const subidaManual({Key? key}) : super(key: key);

  @override
  State<subidaManual> createState() => _subidaManualState();
}

class _subidaManualState extends State<subidaManual> {
  final tituloController = TextEditingController();
  final autorController = TextEditingController();
  final anoController = TextEditingController();
  final editorialController = TextEditingController();
  final resumenController = TextEditingController();
  final otrotituloController = TextEditingController();
  final cddController = TextEditingController();
  final isbnController = TextEditingController();
  final tipomaterialController = TextEditingController();

  bool error = false;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    const style = TextStyle(fontWeight: FontWeight.bold);

    return Scaffold(
      appBar: BaseAppBar(title: const Text('Añadir libro'), appBar: AppBar()),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Column(
              children: [
                const SizedBox(height: 30),
                Row(
                  children: [
                    const SizedBox(
                        width: 100,
                        child: Text(
                          'Titulo: ',
                          style: style,
                        )),
                    Expanded(
                      child: TextFormField(
                        controller: tituloController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Este campo es obligatorio';
                          }
                          return null;
                        },
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 30),
                Row(
                  children: [
                    const SizedBox(
                        width: 100,
                        child: Text(
                          'Autor: ',
                          style: style,
                        )),
                    Expanded(
                      child: TextFormField(
                        controller: autorController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Este campo es obligatorio';
                          }
                          return null;
                        },
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 30),
                Row(
                  children: [
                    const SizedBox(
                        width: 100,
                        child: Text(
                          'Editorial: ',
                          style: style,
                        )),
                    Expanded(
                      child: TextFormField(
                        controller: editorialController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Este campo es obligatorio';
                          }
                          return null;
                        },
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 30),
                Row(
                  children: [
                    const SizedBox(
                        width: 100,
                        child: Text(
                          'Año:',
                          style: style,
                        )),
                    Expanded(
                      child: TextFormField(
                        controller: anoController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                        ],
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Este campo es obligatorio';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      'ISBN: ',
                      style: style,
                    ),
                    const SizedBox(width: 30),
                    Expanded(
                      child: TextFormField(
                        controller: isbnController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Este campo es obligatorio';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      'CDD:',
                      style: style,
                    ),
                    const SizedBox(width: 30),
                    Expanded(
                      child: TextFormField(
                        controller: cddController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Este campo es obligatorio';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    const SizedBox(
                        width: 100,
                        child: Text(
                          'Resumen: ',
                          style: style,
                        )),
                    Expanded(
                      child: TextFormField(
                        controller: resumenController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Este campo es obligatorio';
                          }
                          return null;
                        },
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    const SizedBox(
                        width: 100,
                        child: Text(
                          'Otro título: ',
                          style: style,
                        )),
                    Expanded(
                      child: TextFormField(
                        controller: otrotituloController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Este campo es obligatorio';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      'Tipo Material: ',
                      style: style,
                    ),
                    const SizedBox(width: 30),
                    Expanded(
                      child: TextFormField(
                        controller: tipomaterialController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Este campo es obligatorio';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        guardarLibro();
                      }
                    },
                    child: const SizedBox(
                        height: 40,
                        width: 100,
                        child: Center(child: Text("Guardar"))),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void guardarLibro() async {
    showDialog(
        // The user CANNOT close this dialog  by pressing outsite it
        barrierDismissible: false,
        context: context,
        builder: (_) {
          return Dialog(
            // The background color
            backgroundColor: Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  // The loading indicator
                  CircularProgressIndicator(),
                  SizedBox(
                    height: 15,
                  ),
                  // Some text
                  Text('Cargando...')
                ],
              ),
            ),
          );
        });

    try {
      Libro libro = Libro(
          titulo: tituloController.text,
          autor: autorController.text,
          ano: int.parse(anoController.text),
          editorial: editorialController.text,
          resumen: resumenController.text,
          otroTitulo: otrotituloController.text,
          cdd: cddController.text,
          isbn: isbnController.text,
          tipoMaterial: tipomaterialController.text);

      Libro? libroGuardado = await LibroService.postLibro(libro);
      clearForm();
      Navigator.pushReplacementNamed(context, "datos",
          arguments: libroGuardado);
    } catch (e) {
      clearForm();
    }
  }

  void clearForm() {
    setState(() {
      tituloController.clear();
      autorController.clear();
      anoController.clear();
      editorialController.clear();
      resumenController.clear();
      otrotituloController.clear();
      cddController.clear();
      isbnController.clear();
      tipomaterialController.clear();
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Hubo un error"),
        backgroundColor: Colors.red,
      ));
    });
  }
}
