import 'dart:ffi';

import 'package:projeto_prova/Theme/AppTheme.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:projeto_prova/Widgets/DrawerMenu.dart';
import 'package:projeto_prova/Servicos/firebase_servico.dart';
import 'package:projeto_prova/Models/tarefa.dart';


class Telatarefas extends StatefulWidget{
  @override
 State<Telatarefas> createState() => _TelaTarefas();
}

class _TelaTarefas extends State<Telatarefas>{
  var modo;
  Future<void> escolherTema() async {
    final prefs = await SharedPreferences.getInstance();
    if(prefs.getString("tema") == "Escuro"){
      modo = ThemeMode.dark;
    }else{
      modo = ThemeMode.light;
    }
  }
  
   List<Tarefa> itens = FirebaseServico().listarTarefas() as List<Tarefa> ;

  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Apptheme.light,
      darkTheme: Apptheme.Dark,
      themeMode: modo,
      home: Scaffold(
          drawer: Drawermenu().listaDrawer(context),
          body: Column(children: [
            ListView.builder(
            itemCount: itens.length,
            itemBuilder: (context, index) {
              final item = itens[index];
              return ListTile(
                title: itens[index].titulo,
                subtitle: itens[index].dataVencimento,
                leading:  ,
                onTap: () {
                  
                },

              );
            },
          ),
          ],)
      ),
    );
  }
}