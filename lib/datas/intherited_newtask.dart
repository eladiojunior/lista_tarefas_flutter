import 'package:flutter/material.dart';

import '../components/task.dart';

class InheritedNewTask extends InheritedWidget {
  InheritedNewTask({Key? key, required Widget child}) : super(key: key, child: child);

  final List<TaskWidget> taskList = [
    TaskWidget("Aprender Flutter", "assets/images/image1.png", 3),
    TaskWidget("Andar de Bike", "assets/images/image2.webp", 1),
    TaskWidget("Meditar", "assets/images/image3.jpeg", 5),
  ];

  void addNewTask(String name, int difficuty, String urlPhoto) {
    taskList.add(TaskWidget(name, urlPhoto, difficuty));
  }

  int countTasks() {
    return taskList.isEmpty?0:taskList.length;
  }
  bool isTasks() {
    return taskList.isNotEmpty;
  }

  static InheritedNewTask of(BuildContext context) {
    final InheritedNewTask? result =
        context.dependOnInheritedWidgetOfExactType<InheritedNewTask>();
    assert(result != null, 'No InheritedNewTask found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(InheritedNewTask oldWidget) {
    return oldWidget.taskList.length != taskList.length;
  }

}
