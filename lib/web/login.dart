import 'package:bib_digitalapp/base_app_bar.dart';
import 'package:bib_digitalapp/modelo/globalData.dart';
import 'package:bib_digitalapp/modelo/postLogin.dart';
import 'package:bib_digitalapp/services/loginService.dart';
import 'package:flutter/material.dart';

class VistaLoginWeb extends StatefulWidget {
  const VistaLoginWeb({Key? key}) : super(key: key);

  @override
  State<VistaLoginWeb> createState() => _VistaLoginWebState();
}

class _VistaLoginWebState extends State<VistaLoginWeb> {
  TextEditingController emailController = TextEditingController();
  TextEditingController pswdController = TextEditingController();
  String dropdownValue = 'bibliotecario';

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
                  items: <String>['bibliotecario', 'admin']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                const Text("LOGIN"),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: TextField(
                    controller: emailController,
                    decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        labelText: "E-mail"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: TextField(
                    obscureText: true,
                    controller: pswdController,
                    decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        labelText: "Contraseña"),
                  ),
                ),
                Align(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: Colors.green),
                        onPressed: () {
                          login(emailController.text, pswdController.text,
                              dropdownValue);
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
    mostrarDialog();
    try {
      print('hola');
      PostLogin credenciales = PostLogin(email: email, contrasena: pswd);
      var response;
      if (tipo == 'bibliotecario') {
        response = await LoginService.loginBibliotecario(credenciales);
      } else if (tipo == 'admin') {
        response = await LoginService.loginAdmin(credenciales);
      } else {
        throw Exception("No es un tipo de usuario valido");
      }
      //var token = response[0];

      //variable sglobales
      GlobalData.idUser = int.parse(response[1]);
      GlobalData.token = response[0];
      GlobalData.type = tipo;
      print('token: ' + GlobalData.idUser.toString());
      print('userId: ' + GlobalData.token.toString());
      Navigator.pop(context);
      Navigator.pushReplacementNamed(context, 'buscadorWeb');
    } catch (e) {
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Hubo un error: " + e.toString()),
        backgroundColor: Colors.red,
      ));
    }
  }

  void mostrarDialog() {
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
  }
}
