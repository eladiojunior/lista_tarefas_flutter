import 'package:flutter/material.dart';
import 'package:lista_tarefas_flutter/components/task.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
      body: Container(
        color: Colors.blue[100],
        child: AnimatedOpacity(
          opacity: tasksVisibility ? 1 : 0,
          duration: const Duration(milliseconds: 500),
          child: ListView(children: const [
            TaskWidget(
                "Aprender Flutter",
                "assets/images/image1.png",
                3),
            TaskWidget(
                "Andar de Bike",
                "assets/images/image2.webp",
                1),
            TaskWidget(
                "Meditar",
                "assets/images/image3.jpeg",
                5),
            TaskWidget(
                "Ler um livro",
                "assets/images/image4.jpg",
                2),
            TaskWidget("Jogar",
                "assets/images/image5.jpg",
                1),
            SizedBox(height: 80)
          ]),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.plus_one),
      ),
    );
  }
}
