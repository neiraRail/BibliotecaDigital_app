import 'package:flutter/material.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:dotted_border/dotted_border.dart';

import '../modelo/file_DataModel.dart';

class DropZoneWidget extends StatefulWidget {
  final ValueChanged<File_Data_Model> onDroppedFile;

  const DropZoneWidget({Key? key, required this.onDroppedFile})
      : super(key: key);
  @override
  _DropZoneWidgetState createState() => _DropZoneWidgetState();
}

class _DropZoneWidgetState extends State<DropZoneWidget> {
  //controller to hold data of file dropped by user
  late DropzoneViewController controller;
  // a variable just to update UI color when user hover or leave the drop zone
  bool highlight = false;

  @override
  Widget build(BuildContext context) {
    return buildDecoration(
        child: Stack(
      children: [
        // dropzone area
        Container(
          height: 200,
          child: DropzoneView(
            // attach an configure the controller
            onCreated: (controller) => this.controller = controller,
            // call UploadedFile method when user drop the file
            onDrop: UploadedFile,
            // change UI when user hover file on dropzone
            onHover: () => setState(() => highlight = true),
            onLeave: () => setState(() => highlight = false),
            onLoaded: () => print('Zone Loaded'),
            onError: (err) => print('run when error found : $err'),
          ),
        ),

        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.cloud_upload_outlined,
                size: 80,
                color: Colors.white,
              ),
              Text(
                'Drop Files Here',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
              const SizedBox(
                height: 16,
              ),
              // a button to pickfile from computer
              ElevatedButton.icon(
                onPressed: () async {
                  final events = await controller.pickFiles();
                  if (events.isEmpty) return;
                  UploadedFile(events.first);
                },
                icon: Icon(Icons.search),
                label: Text(
                  'Choose File',
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
                style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    primary: highlight ? Colors.blue : Colors.green.shade300,
                    shape: RoundedRectangleBorder()),
              )
            ],
          ),
        ),
      ],
    ));
  }

  Future UploadedFile(dynamic event) async {
    // this method is called when user drop the file in drop area in flutter

    final name = event.name;
    final mime = await controller.getFileMIME(event);
    final byte = await controller.getFileSize(event);
    final url = await controller.createFileUrl(event);

    print('Name : $name');
    print('Mime: $mime');

    print('Size : ${byte / (1024 * 1024)}');
    print('URL: $url');

    // update the data model with recent file uploaded
    final droppedFile =
        File_Data_Model(name: name, mime: mime, bytes: byte, url: url);

    //Update the UI
    widget.onDroppedFile(droppedFile);
    setState(() {
      highlight = false;
    });
  }

  Widget buildDecoration({required Widget child}) {
    final colorBackground = highlight ? Colors.blue : Colors.green;
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: EdgeInsets.all(10),
        child: DottedBorder(
            borderType: BorderType.RRect,
            color: Colors.white,
            strokeWidth: 3,
            dashPattern: [8, 4],
            radius: Radius.circular(10),
            padding: EdgeInsets.zero,
            child: child),
        color: colorBackground,
      ),
    );
  }
}
