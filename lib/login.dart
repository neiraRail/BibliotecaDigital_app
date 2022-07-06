import 'package:bib_digitalapp/base_app_bar.dart';
import 'package:bib_digitalapp/modelo/postLogin.dart';
import 'package:bib_digitalapp/services/loginService.dart';
import 'package:flutter/material.dart';

class VistaLogin extends StatefulWidget {
  const VistaLogin({Key? key}) : super(key: key);

  @override
  State<VistaLogin> createState() => _VistaLoginState();
}

class _VistaLoginState extends State<VistaLogin> {
  TextEditingController emailController = TextEditingController();
  TextEditingController pswdController = TextEditingController();
  String dropdownValue = 'alumno';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: const Text(
          "Login",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        appBar: AppBar(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 30),
        child: Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
              color: Colors.grey),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 80),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                DropdownButton<String>(
                  value: dropdownValue,
                  elevation: 16,
                  style: const TextStyle(color: Colors.deepPurple),
                  underline: Container(
                    height: 2,
                    color: Colors.deepPurpleAccent,
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue = newValue!;
                    });
                  },
                  items: <String>['alumno', 'bibliotecario', 'admin']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                const Text("LOGIN"),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 50),
                  child: TextField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: TextField(
                    controller: pswdController,
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                ),
                Align(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: Colors.green),
                        onPressed: () {
                          login(emailController.text, pswdController.text,
                              dropdownValue);
                          //Navigator.pushNamed(context, 'buscador');
                        },
                        child: const SizedBox(
                            width: 60, height: 20, child: Text('Aceptar'))))
              ],
            ),
          ),
        ),
      ),
    );
  }

  void login(String email, String pswd, String tipo) async {
    try {
      PostLogin credenciales = PostLogin(email: email, contrasena: pswd);
      var response;
      if (tipo == 'alumno') {
        response = await LoginService.loginAlumno(credenciales);
      } else if (tipo == 'bibliotecario') {
        response = await LoginService.loginBibliotecario(credenciales);
      } else if (tipo == 'admin') {
        response = await LoginService.loginAdmin(credenciales);
      } else {
        throw Exception("No es un tipo de usuario valido");
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Hubo un error: " + e.toString()),
        backgroundColor: Colors.red,
      ));
    }
  }
}
