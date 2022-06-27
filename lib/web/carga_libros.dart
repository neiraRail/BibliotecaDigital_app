import 'package:bib_digitalapp/web/drop_zone_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:desktop_drop/desktop_drop.dart';
import '../modelo/file_DataModel.dart';
import '../services/archivoService.dart';
import 'dropped_file_widget.dart';
import 'package:cross_file/cross_file.dart';

class CargaLibros extends StatefulWidget {
  const CargaLibros({Key? key}) : super(key: key);

  @override
  State<CargaLibros> createState() => _CargaLibrosState();
}

class _CargaLibrosState extends State<CargaLibros> {
  late XFile _file;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Carga de libros"),
      ),
      body: Column(children: [
        Wrap(
          direction: Axis.horizontal,
          runSpacing: 8,
          spacing: 8,
          children: [
            ExmapleDragTarget(
              onDropped: (file) {
                setState(() {
                  _file = file;
                });
              },
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
              ),
              onPressed: () {},
              child: const SizedBox(
                height: 40,
                width: 100,
                child: Center(
                  child: Text("Cancelar"),
                ),
              ),
            ),
            const SizedBox(
              width: 30,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
              ),
              onPressed: () {
                try {
                  ArchivoService.enviar(_file);
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(e.toString()),
                    backgroundColor: Colors.red,
                  ));
                }
              },
              child: const SizedBox(
                height: 40,
                width: 100,
                child: Center(
                  child: Text("Aceptar"),
                ),
              ),
            ),
            const SizedBox(
              width: 100,
            ),
          ],
        )
      ]),
    );
  }
}

class ExmapleDragTarget extends StatefulWidget {
  const ExmapleDragTarget({Key? key, required this.onDropped})
      : super(key: key);
  final Function onDropped;

  @override
  _ExmapleDragTargetState createState() => _ExmapleDragTargetState();
}

class _ExmapleDragTargetState extends State<ExmapleDragTarget> {
  List<XFile> _list = [];

  bool _dragging = false;

  Offset? offset;

  @override
  Widget build(BuildContext context) {
    return DropTarget(
      onDragDone: (detail) async {
        setState(() {
          _list = [detail.files.last];
          widget.onDropped(_list[0]);
        });

        debugPrint('onDragDone:');
        for (final file in detail.files) {
          debugPrint('  ${file.path} ${file.name}'
              '  ${await file.lastModified()}'
              '  ${await file.length()}'
              '  ${file.mimeType}');
        }
      },
      onDragUpdated: (details) {
        setState(() {
          offset = details.localPosition;
        });
      },
      onDragEntered: (detail) {
        setState(() {
          _dragging = true;
          offset = detail.localPosition;
        });
      },
      onDragExited: (detail) {
        setState(() {
          _dragging = false;
          offset = null;
        });
      },
      child: Container(
        height: 200,
        width: 200,
        color: _dragging ? Colors.blue.withOpacity(0.4) : Colors.black26,
        child: Stack(
          children: [
            if (_list.isEmpty)
              const Center(child: Text("Drop here"))
            else
              Text(_list.map((e) => e.path).join("\n")),
            if (offset != null)
              Align(
                alignment: Alignment.topRight,
                child: Text(
                  '$offset',
                  style: Theme.of(context).textTheme.caption,
                ),
              )
          ],
        ),
      ),
    );
  }
}
