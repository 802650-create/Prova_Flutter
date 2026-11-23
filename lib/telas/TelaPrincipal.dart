import "package:flutter/material.dart";
import 'package:shared_preferences/shared_preferences.dart';
import 'package:projeto_prova/Theme/AppTheme.dart';
import 'package:projeto_prova/Widgets/DrawerMenu.dart';

 class  Telaprincipal extends StatefulWidget {
  
    @override
    State<Telaprincipal> createState() => _TelaPrincipal();
}

class  _TelaPrincipal extends State<Telaprincipal>{
  var modo;
  Future<void> escolherTema() async {
    final prefs = await SharedPreferences.getInstance();
    if(prefs.getString("tema") == "Escuro"){
      modo = ThemeMode.dark;
    }else{
      modo = ThemeMode.light;
    }
  }
  
   
     @override
    Widget build(BuildContext context) {
      return MaterialApp(
        theme: Apptheme.light,
        darkTheme: Apptheme.Dark,
        themeMode: modo,
        home: Scaffold(
           drawer: Drawermenu().listaDrawer(context),
            appBar: AppBar(title: Text("inicio")),
            body: Column(children: [
              Text("Alto"),

            ],)
        ),
      );
    }


}