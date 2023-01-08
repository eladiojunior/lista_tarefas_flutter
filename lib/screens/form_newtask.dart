import 'package:flutter/material.dart';
import 'package:lista_tarefas_flutter/datas/intherited_newtask.dart';

class FormNewTask extends StatefulWidget {
  const FormNewTask({Key? key, required this.taskContext}) : super(key: key);

  final BuildContext taskContext;

  @override
  State<FormNewTask> createState() => _FormNewTaskState();
}

class _FormNewTaskState extends State<FormNewTask> {
  TextEditingController nameTaskController = TextEditingController();
  TextEditingController difficultyTaskController = TextEditingController();
  TextEditingController imageTaskController = TextEditingController();

  final _formNewTask = GlobalKey<FormState>();

  bool valueValidator(String? value) {
    return (value!=null && value.isNotEmpty);
  }
  bool difficultyValidator(String? value) {
    return valueValidator(value) &&
        (int.parse(value!) >= 1 && int.parse(value!) <= 5);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formNewTask,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Nova Tarefa"),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              height: 550,
              width: 375,
              decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.black26, width: 3)),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 8, 8, 4),
                    child: TextFormField(
                      validator: (String? value) {
                        if (!valueValidator(value)) {
                          return "Informe o nome da nova tarefa.";
                        }
                        return null;
                      },
                      controller: nameTaskController,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          fillColor: Colors.white70,
                          hintText: "Nome da nova tarefa",
                          filled: true),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
                    child: TextFormField(
                      validator: (value) {
                        if (!valueValidator(value)) {
                          return "Informe o nível de dificultade da nova tarefa.";
                        } else if (!difficultyValidator(value)) {
                          return "informe um nível dificuldade entre 1 a 5.";
                        }
                        return null;
                      },
                      keyboardType: TextInputType.number,
                      controller: difficultyTaskController,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          fillColor: Colors.white70,
                          hintText: "Nível de dificuldade",
                          filled: true),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 4, 8, 8),
                    child: TextFormField(
                      validator: (value) {
                        if (!valueValidator(value)) {
                          return "Informe uma URL de imagem da nova tarefa.";
                        }
                        return null;
                      },
                      onChanged: (text) {
                        setState(() { });
                      },
                      keyboardType: TextInputType.url,
                      controller: imageTaskController,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          fillColor: Colors.white70,
                          hintText: "Imagem da tarefa",
                          filled: true),
                    ),
                  ),
                  Container(
                    height: 100,
                    width: 75,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(width: 2, color: Colors.black38)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(imageTaskController.text,
                          fit: BoxFit.cover, errorBuilder: (BuildContext context,
                              Object exception, StackTrace? stackTrace) {
                        return Image.asset("assets/images/sem_foto.png");
                      }),
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        if (_formNewTask.currentState!.validate()) {
                          InheritedNewTask.of(widget.taskContext)
                              .addNewTask(nameTaskController.text, int.parse(difficultyTaskController.text), imageTaskController.text);
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Registrando sua nova tarefa."),
                              )
                          );
                          Navigator.pop(context);
                        }
                      },
                      child: const Text("Adicionar"))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
