import 'package:bib_digitalapp/base_app_bar.dart';
import 'package:bib_digitalapp/modelo/alumno.dart';
import 'package:bib_digitalapp/services/alumnoService.dart';
import 'package:flutter/material.dart';

import '../menu.dart';
import '../modelo/globalData.dart';



class VistaPerfil extends StatefulWidget {
  const VistaPerfil({Key? key}) : super(key: key);
  
  @override
  State<VistaPerfil> createState() => _VistaPerfilState();
}

class _VistaPerfilState extends State<VistaPerfil> {
  var idUsuario =GlobalData.idUser;
  
  
  bool isLoaded= true;
   @override
    void initState() {
      
      super.initState();
      fetchAlumno();
  }

  fetchAlumno() async {
    Alumno? alumno = await AlumnoService.getAlumno(GlobalData.idUser);
    
    if (alumno != null) {
      GlobalData.nombre= alumno.nombres;
      GlobalData.apellido= alumno.apellidos;
      GlobalData.run= alumno.run.toString();
      GlobalData.email= alumno.email;
      setState(() {isLoaded= true;});

      }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: const Text("Perfil"),
        appBar: AppBar(),
      ),
      drawer: Menu( ),
      body: Visibility(
        visible: isLoaded,
        child: Column(children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.network(
                  'https://picsum.photos/250?image=9',
                  scale: 1.2,
                ),
              ),
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children:  [
                            const Text(
                              "Nombre: ",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(GlobalData.nombre + ' '+ GlobalData.apellido ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children:  [
                            Text(
                              "Matricula: ",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text( GlobalData.run),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children:  [
                            Text(
                              "Correo: ",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(GlobalData.email),
                            ),
                          ],
                        ),
                        
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
          
        ]),
        replacement: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
  
  
}