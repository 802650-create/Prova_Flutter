import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";
import 'package:projeto_prova/Servicos/Preferencias_servico.dart';
import 'package:projeto_prova/telas/TelaLogin.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:projeto_prova/Theme/AppTheme.dart';
import 'package:projeto_prova/Servicos/auth_servico.dart';

class Telacadastrousuario extends StatefulWidget {
  
  @override
  State<Telacadastrousuario> createState() => _TelaCadastroUsuario(); 
}

class _TelaCadastroUsuario extends State<Telacadastrousuario>{
  final _nomeController = TextEditingController();
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  

  
  
  var modo;
  Future<void> escolherTema() async {
    if(PreferenciasServico().carregarTema() == "Escuro"){
      modo = ThemeMode.dark;
    }else{
      modo = ThemeMode.light;
    }
  }
  
 

  @override
  void dispose() {
    _nomeController.dispose();
    _emailController.dispose();
    _senhaController.dispose();
    super.dispose();
  }


     @override
    Widget build(BuildContext context) {
      return MaterialApp(
        theme: Apptheme.light,
        darkTheme: Apptheme.Dark,
        themeMode: modo,
        home: Scaffold(
          body: Form(
            key: _formKey , 
            child: Column(children: [
            TextFormField(
              controller: _nomeController,
              decoration: InputDecoration(labelText: "Nome"),
              validator: (valor) {
                if(valor == null || valor.isEmpty){
                  return "Digite o nome corretamente";
                }
                return null;
              },
            ),
            TextFormField(
              controller: _emailController , 
              decoration: InputDecoration(labelText: "Email"),
              validator: (value) {
                if(value == null || !value.contains("@gmail.com")){
                  return "Coloque o nome corretamente";
                }
                return null;
              },
            ),
            TextFormField(
              controller: _senhaController,
              decoration: InputDecoration(labelText: "Senha"),
              validator:  (value) {
                if(value == null || value.length < 8){
                  return "Digite senha 8 characteres no minimo";
                }
                return null;
              },
            ),
            ElevatedButton(onPressed: () async{
              bool sucesso = AuthServico().createUserWithEmailPassword(_emailController.text, _senhaController.text) as bool;

              if(sucesso == true){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Telalogin()));
              }else{
                print("Senha ou email incorretos");
              }
              
            }, child: Align(alignment: Alignment.center,
            child: Text("Cadastrar"),))
           

          ],))

          ,)
        );
      
    }

}