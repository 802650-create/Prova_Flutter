import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:projeto_prova/Widgets/DrawerMenu.dart';
import 'package:projeto_prova/Theme/AppTheme.dart';

class Telaconfiguracoes extends StatefulWidget {

  State<Telaconfiguracoes> createState() => 
}

class
   @override
    Widget build(BuildContext context) {
      return MaterialApp(
          home: Scaffold(
            body: Column(children: [
              Text("Tema do site"),
              ElevatedButton(onPressed: () async {
                final prefs = await SharedPreferences.getInstance();
                await prefs.setString("tema", "Escuro");
                //Codigo para deixar a tela no tema escuro
              }, child: Text("Modo Escuro")),
              ElevatedButton(onPressed: () async {
                final prefs = await SharedPreferences.getInstance();
                await prefs.setString("tema", "Claro");
                //Codigo para deixar a tela no tema claro
              }, child: Text("Modo Claro"))
            ],)
          ),

      );
    }

}