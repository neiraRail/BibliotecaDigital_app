import 'package:bib_digitalapp/base_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class subidaManual extends StatefulWidget {
  const subidaManual({Key? key}) : super(key: key);

  @override
  State<subidaManual> createState() => _subidaManualState();
}

class _subidaManualState extends State<subidaManual> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(title: const Text('Añadir libro'), appBar: AppBar()),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          children: [
            SizedBox(height: 30),
            Row(
              children: [
                const Text('Titulo: '),
                SizedBox( width: 30),
                Expanded(
                  child: const TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    
                    ),
                  ),
                )

              ],
            ),
            SizedBox(height: 30),
            Row(
              children: [
                const Text('Autor: '),
                SizedBox( width: 30),
                Expanded(
                  child: const TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    
                    ),
                  ),
                )

              ],
            ),
            SizedBox(height: 30),
            Row(
              children: [
                const Text('Editorial: '),
                SizedBox( width: 30),
                Expanded(
                  child: const TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    
                    ),
                  ),
                )

              ],
            ),
            SizedBox(height: 20),
            Align(
              alignment:  Alignment.centerRight,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.amber,
                ),
                onPressed: () {},
                child: const Text("guardar"),
              ),
            )
          ],
        ),
      )
    );
  }
}