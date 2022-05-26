import 'package:bib_digitalapp/libro_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:bib_digitalapp/base_app_bar.dart';

class historialWeb extends StatefulWidget {
  const historialWeb({Key? key}) : super(key: key);

  @override
  State<historialWeb> createState() => _historialWebState();
}

class _historialWebState extends State<historialWeb> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(title: const Text('Historial de préstamos'), appBar: AppBar()),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          children: [
            Row(
              children: [
                const Expanded(
                  child: TextField()
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
                //aqui voy a poner filtros
              ],
            ),
            Expanded(child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15),
                ),
                color: Colors.deepPurple
              ),
              child: GridView.builder(
                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                   crossAxisCount: 2,
                   childAspectRatio: 7 / 2,

                 ),
                
                itemCount: 10,
                
                itemBuilder: (context,i){
                  return const LibroCard();
                }
            )
            )
            )
          ]
        ),
        
      ),


    );
  }
}