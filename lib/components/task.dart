import 'package:flutter/material.dart';
import 'package:lista_tarefas_flutter/components/difficulty.dart';

class TaskWidget extends StatefulWidget {
  final String nameTask;
  final String imageTask;
  final int difficultyLevel;

  TaskWidget(this.nameTask, this.imageTask, this.difficultyLevel, {Key? key}) : super(key: key);

  int levelTask = 0;

  @override
  State<TaskWidget> createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {

  StatefulWidget getImageTask() {
    bool isImgAssetOrNetwork = widget.imageTask.toLowerCase().contains("http");
    return (isImgAssetOrNetwork ?
      Image.network(widget.imageTask, fit: BoxFit.cover) :
      Image.asset(widget.imageTask, fit: BoxFit.cover));
  }

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
                        child: getImageTask(),
                      )),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                          width: 240,
                          child: Text(widget.nameTask,
                              style: const TextStyle(fontSize: 24),
                              overflow: TextOverflow.ellipsis)),
                      DifficultyWidget(difficultyLevel: widget.difficultyLevel)
                    ],
                  ),
                  SizedBox(
                    height: 52,
                    width: 52,
                    child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            widget.levelTask++;
                          });
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: const [
                            Icon(Icons.arrow_drop_up),
                            Text("UP", style: TextStyle(fontSize: 15))
                          ],
                        )),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(0.5)
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                      width: 200,
                      child: LinearProgressIndicator(
                        color: Colors.white,
                        value: (widget.difficultyLevel > 0)
                            ? ((widget.levelTask / widget.difficultyLevel) / 10)
                            : 1,
                        minHeight: 15,
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Nível: ${widget.levelTask}",
                      style: const TextStyle(color: Colors.white, fontSize: 20)),
                )
              ],
            )
          ],
        )
      ]),
    );
  }
}