import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:projeto_prova/Models/tarefa.dart';

class FirebaseServico {
  FirebaseDatabase database = FirebaseDatabase.instance;


  void RegistrarTarefa(String titulo, int prioridade, String descricao, String DataVencimento, bool concluida ) {
  DatabaseReference ref = database.ref('tarefas');
  ref.set({'titulo': titulo, 'prioridade': prioridade, 'Descrição': descricao, 'DataVencimento': DataVencimento, 'concluido': concluida});
  }



Future listarTarefas() async {
    DatabaseReference ref = database.ref('tarefas');
    DatabaseEvent event = await ref.once();
    List tarefas = [];
    if (event.snapshot.value != null) {
      Map map = event.snapshot.value as Map;
      map.forEach((key, value) {
        final tarefaMap = Map.from(value as Map);
        tarefaMap['id'] = key; // 🔸 injeta o key como id
        tarefas.add(Tarefa().fromMap(tarefaMap));
      });
    }
    return tarefas;
  }


}