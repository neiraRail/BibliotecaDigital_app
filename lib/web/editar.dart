import 'package:bib_digitalapp/base_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

import '../modelo/libro.dart';
import '../services/libroService.dart';

class editar extends StatefulWidget {
  const editar({Key? key}) : super(key: key);

  @override
  State<editar> createState() => _editarState();
}

class _editarState extends State<editar> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController tituloController;
  late TextEditingController autorController;
  late TextEditingController anoController;
  late TextEditingController editorialController;
  late TextEditingController resumenController;
  late TextEditingController otrotituloController;
  late TextEditingController cddController;
  late TextEditingController isbnController;
  late TextEditingController tipomaterialController;

  @override
  Widget build(BuildContext context) {
    const style = TextStyle(fontWeight: FontWeight.bold);
    final args = ModalRoute.of(context)!.settings.arguments as Libro?;

    tituloController = TextEditingController(text: args?.titulo);
    autorController = TextEditingController(text: args?.autor);
    anoController = TextEditingController(text: args?.ano.toString());
    editorialController = TextEditingController(text: args?.editorial);
    resumenController = TextEditingController(text: args?.resumen);
    otrotituloController = TextEditingController(text: args?.otroTitulo);
    cddController = TextEditingController(text: args?.cdd);
    isbnController = TextEditingController(text: args?.isbn);
    tipomaterialController = TextEditingController(text: args?.tipoMaterial);

    return Scaffold(
        appBar: BaseAppBar(title: const Text('Editar libro'), appBar: AppBar()),
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
                          enabled: args != null,
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
                          enabled: args != null,
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
                          enabled: args != null,
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
                          enabled: args != null,
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
                          enabled: args != null,
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
                          enabled: args != null,
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
                          enabled: args != null,
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
                          enabled: args != null,
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
                          enabled: args != null,
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
                      onPressed: args != null
                          ? () {
                              if (_formKey.currentState!.validate()) {
                                editarLibro(args.idLibro);
                              }
                            }
                          : null,
                      child: const SizedBox(
                          width: 100,
                          height: 40,
                          child: Center(child: Text("Guardar"))),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }

  void editarLibro(idlibro) async {
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
      },
    );
    Libro libro = Libro(
        idLibro: idlibro,
        titulo: tituloController.text,
        autor: autorController.text,
        ano: int.parse(anoController.text),
        editorial: editorialController.text,
        resumen: resumenController.text,
        otroTitulo: otrotituloController.text,
        cdd: cddController.text,
        isbn: isbnController.text,
        tipoMaterial: tipomaterialController.text);

    bool success = await LibroService.putLibro(libro);
    if (success) {
      Navigator.pop(context);
      Navigator.pushReplacementNamed(context, 'buscadorWeb');
    } else {
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Hubo un error"),
        backgroundColor: Colors.red,
      ));
    }
  }
}
