import 'package:bib_digitalapp/base_app_bar.dart';
import 'package:flutter/material.dart';

class VistaLogin extends StatefulWidget {
  const VistaLogin({Key? key}) : super(key: key);

  @override
  State<VistaLogin> createState() => _VistaLoginState();
}

class _VistaLoginState extends State<VistaLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: Text(
          "Login",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        appBar: AppBar(),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 30),
        child: Container(
          decoration:  BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
              color: Colors.grey),
          child: Padding(
            padding:EdgeInsets.symmetric(vertical: 80),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("LOGIN"),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 50),
                  child: TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 50),
                  child: TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                ),
                
                Align(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.green),
                    onPressed:() => Navigator.pushNamed(context, 'buscador'),
                    child: 
                    SizedBox(width: 60, height: 20, child: Text('Aceptar') )
                  )
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
