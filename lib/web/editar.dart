import 'package:bib_digitalapp/base_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class editar extends StatefulWidget {
  const editar({Key? key}) : super(key: key);

  @override
  State<editar> createState() => _editarState();
}

class _editarState extends State<editar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(title: const Text('Editar libro'), appBar: AppBar()),
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
            SizedBox(height: 30),
            Row(
              children: [
                const Text('Categoría: '),
                SizedBox( width: 30),
                Expanded(
                  child: const TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    
                    ),
                  ),

                ),
                SizedBox( width: 30),
                const Text('Año:'),
                SizedBox( width: 30),
                Expanded(
                  child: const TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    
                    ),
                  ),

                ),

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