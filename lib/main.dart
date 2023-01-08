import 'package:flutter/material.dart';
import 'package:lista_tarefas_flutter/screens/screen_initial.dart';

import 'datas/intherited_newtask.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lista de Tarefas',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: InheritedNewTask(child: ScreenInitial()),
    );
  }
}
