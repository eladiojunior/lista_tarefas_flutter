import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super (key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool tarefas_visivel = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lista de Tarefas',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.task_alt_sharp),
          actions: [
            IconButton(
                icon: tarefas_visivel
                    ? Icon(Icons.visibility_off)
                    : Icon(Icons.visibility_rounded),
                tooltip: tarefas_visivel ? 'Ocultar tarefas' : 'Visualizar tarefas',
                onPressed: () {
                  setState(() {
                    tarefas_visivel = !tarefas_visivel;
                  });
                }),
          ],
          title: Text("Lista de Tarefas"),
        ),
        body: Container(
          color: Colors.blue[100],
          child: AnimatedOpacity(
            opacity: tarefas_visivel ? 1 : 0,
            duration: Duration(milliseconds: 500),
            child: ListView(children: [
              Tarefa(
                  "Aprender Flutter",
                  "https://pbs.twimg.com/media/Eu7m692XIAEvxxP?format=png&name=large",
                  3),
              Tarefa(
                  "Andar de Bike",
                  "https://tswbike.com/wp-content/uploads/2020/09/108034687_626160478000800_2490880540739582681_n-e1600200953343.jpg",
                  1),
              Tarefa(
                  "Meditar",
                  "https://manhattanmentalhealthcounseling.com/wp-content/uploads/2019/06/Top-5-Scientific-Findings-on-MeditationMindfulness-881x710.jpeg",
                  5),
              Tarefa(
                  "Ler um livro",
                  "https://thebogotapost.com/wp-content/uploads/2017/06/636052464065850579-137719760_flyer-image-1.jpg",
                  2),
              Tarefa("Jogar",
                  "https://i.ibb.co/tB29PZB/kako-epifania-2022-2-c-pia.jpg", 1),
              Container(height: 80)
            ]),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.plus_one),
        ),
      ),
    );
  }
}

class Tarefa extends StatefulWidget {
  final String nome;
  final String imagem;
  final int dificuldade;

  const Tarefa(this.nome, this.imagem, this.dificuldade, {Key? key})
      : super(key: key);

  @override
  State<Tarefa> createState() => _TarefaState();
}

class _TarefaState extends State<Tarefa> {
  int nivel = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(children: [
        Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.0), color: Colors.blue),
            height: 140),
        Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.0),
                  color: Colors.white),
              height: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.0),
                          color: Colors.black26),
                      width: 75,
                      height: 100,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(4.0),
                        child: Image.network(
                          widget.imagem,
                          fit: BoxFit.cover,
                        ),
                      )),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          width: 240,
                          child: Text(widget.nome,
                              style: TextStyle(fontSize: 24),
                              overflow: TextOverflow.ellipsis)),
                      Dificuldade(widget.dificuldade)
                    ],
                  ),
                  Container(
                    height: 52,
                    width: 52,
                    child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            nivel++;
                          });
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Icon(Icons.arrow_drop_up),
                            Text("UP", style: TextStyle(fontSize: 15))
                          ],
                        )),
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      width: 200,
                      child: LinearProgressIndicator(
                        color: Colors.white,
                        value: (widget.dificuldade > 0)
                            ? ((nivel / widget.dificuldade) / 10)
                            : 1,
                        minHeight: 15,
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Nível: $nivel",
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                )
              ],
            )
          ],
        )
      ]),
    );
  }
}

class Dificuldade extends StatelessWidget {
  static const Set<String> DIFICULDADES = {
    "Nenhuma",
    "Muito baixa",
    "Baixa",
    "Média",
    "Alta",
    "Muito Alta"
  };
  final int dificuldade;

  const Dificuldade(this.dificuldade, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.star,
            size: 18,
            color: (dificuldade >= 1) ? Colors.blue : Colors.blue[100]),
        Icon(Icons.star,
            size: 18,
            color: (dificuldade >= 2) ? Colors.blue : Colors.blue[100]),
        Icon(Icons.star,
            size: 18,
            color: (dificuldade >= 3) ? Colors.blue : Colors.blue[100]),
        Icon(Icons.star,
            size: 18,
            color: (dificuldade >= 4) ? Colors.blue : Colors.blue[100]),
        Icon(Icons.star,
            size: 18,
            color: (dificuldade >= 5) ? Colors.blue : Colors.blue[100]),
        Text(
            DIFICULDADES.elementAt(dificuldade > 0
                ? dificuldade > 5
                    ? 5
                    : dificuldade
                : 0),
            style: TextStyle(color: Colors.blueGrey))
      ],
    );
  }
}
