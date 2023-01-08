import 'package:flutter/material.dart';
import 'package:lista_tarefas_flutter/screens/form_newtask.dart';

import '../datas/intherited_newtask.dart';

class ScreenInitial extends StatefulWidget {
  const ScreenInitial({Key? key}) : super(key: key);

  @override
  State<ScreenInitial> createState() => _ScreenInitialState();
}

class _ScreenInitialState extends State<ScreenInitial> {
  bool tasksVisibility = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.task_alt_sharp),
        actions: [
          IconButton(
              icon: tasksVisibility
                  ? const Icon(Icons.visibility_off)
                  : const Icon(Icons.visibility_rounded),
              tooltip:
              tasksVisibility ? 'Ocultar tarefas' : 'Visualizar tarefas',
              onPressed: () {
                setState(() {
                  tasksVisibility = !tasksVisibility;
                });
              }),
        ],
        title: const Text("Lista de Tarefas"),
      ),
      body: Column(
        children: [
          Container(
            height: 523,
            color: Colors.blue[100],
            child: AnimatedOpacity(
              opacity: tasksVisibility ? 1 : 0,
              duration: const Duration(milliseconds: 500),
              child: (InheritedNewTask.of(context).isTasks() ?
                ListView(
                  children: InheritedNewTask.of(context).taskList) :
                Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.fromLTRB(8, 25, 8, 16),
                      child: Text('Você não tem nenhuma tarefa no momento!',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 30, color: Colors.cyan)),
                    ),
                    Image.asset("assets/images/sem_tasks.png")
                  ])
              ),
            ),
          ),
          Container(
            color: Colors.white,
            height: 80,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 8, 8, 8),
                  child: Text(' Quantidade de tarefas: ${InheritedNewTask.of(context).countTasks().toString()} ', style: const TextStyle(fontSize: 18)),
                )
              ],
            ),
              
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (newContext) => FormNewTask(taskContext: context)
              )
          );
        },
        child: const Icon(Icons.plus_one),
      ),
    );
  }
}
