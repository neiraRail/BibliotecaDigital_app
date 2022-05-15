import 'package:bib_digitalapp/base_app_bar.dart';
import 'package:flutter/material.dart';

class VistaBuscador extends StatefulWidget {
  const VistaBuscador({Key? key}) : super(key: key);

  @override
  State<VistaBuscador> createState() => _VistaBuscadorState();
}

class _VistaBuscadorState extends State<VistaBuscador> {
  bool filtro1 = false;
  bool filtro2 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(title: const Text('Buscador'), appBar: AppBar()),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          children: [
            Row(
              children: [
                const Expanded(
                  child: TextField(),
                ),
                IconButton(
                  color: Colors.blueAccent,
                  onPressed: () {},
                  icon: const Icon(Icons.search),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Checkbox(
                  value: filtro1,
                  onChanged: (valor) {},
                ),
                const Text("filtro 1"),
                Checkbox(
                  value: filtro2,
                  onChanged: (valor) {},
                ),
                const Text("filtro 2")
              ],
            ),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                ),
                onPressed: () {},
                child: const Text("Verde"),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                    color: Colors.grey),
                child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, i) {
                    return Container(
                      height: 150,
                      child: Card(
                        color: Colors.transparent,
                        child: Row(
                          children: [
                            Expanded(
                              flex: 33,
                              child: Image.network(
                                'https://picsum.photos/250?image=9',
                              ),
                            ),
                            Expanded(
                              flex: 66,
                              child: Column(
                                children: const [
                                  Text("Titulo del libro"),
                                  Text("Descripión del libro")
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
