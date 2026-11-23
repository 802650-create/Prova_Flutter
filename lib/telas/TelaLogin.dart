import "package:flutter/material.dart";
import 'package:projeto_prova/telas/TelaCadastroUsuario.dart';
import 'package:projeto_prova/telas/TelaPrincipal.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:projeto_prova/Theme/AppTheme.dart';
import 'package:projeto_prova/Widgets/DrawerMenu.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:projeto_prova/Servicos/auth_servico.dart';

class Telalogin extends StatefulWidget  {
@override
State<Telalogin> createState() => _TelaLogin();

}

class _TelaLogin extends State<Telalogin>{

  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  
  //codigo de mudança de tema
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
  void dispose(){
    _emailController.dispose();
    _senhaController.dispose();
    super.dispose();
  } 


    @override
    Widget build(BuildContext context) {
      return MaterialApp(
        theme: Apptheme.light ,
        darkTheme: Apptheme.Dark,
        themeMode: modo ,
        home: Scaffold(
          body: Column(children: [
            Form(key: _formkey,
            child: Column(children: [
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: "Email"),
                validator:(value) {
                  if(value == null || value.isEmpty || !value.contains("@gmail.com")){
                      return "Digite seu email corretamente";
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _senhaController,
                decoration: InputDecoration(labelText: "Senha"),
                validator: (value){
                  if(value == null || value.length < 8 || value.isEmpty){
                    return "Digite sua senha corretamente";
                  }
                  return null;
                },
              ),
              ElevatedButton(onPressed: () async {
                //codigo para verificar se existe as informações no banco de dados. 
                  bool sucesso = AuthServico().signInWithEmailPassword(_emailController.text, _senhaController.text) as bool;
                  if(sucesso == true){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Telaprincipal()));
                  }else{
                    print("senha ou email incorretos");
                  }
              },
               child: Text("Logar")),
               
            ],),)
          ],)
        )
      );
    }

}