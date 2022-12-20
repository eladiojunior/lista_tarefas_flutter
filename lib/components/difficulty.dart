import 'package:flutter/material.dart';

class DifficultyWidget extends StatelessWidget {
  static const Set<String> constDifficutysText = {
    "Nenhuma",
    "Muito baixa",
    "Baixa",
    "Média",
    "Alta",
    "Muito Alta"
  };
  final int difficultyLevel;

  const DifficultyWidget(
      {
        required this.difficultyLevel,
        Key? key
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.star,
            size: 18,
            color: (difficultyLevel >= 1) ? Colors.blue : Colors.blue[100]),
        Icon(Icons.star,
            size: 18,
            color: (difficultyLevel >= 2) ? Colors.blue : Colors.blue[100]),
        Icon(Icons.star,
            size: 18,
            color: (difficultyLevel >= 3) ? Colors.blue : Colors.blue[100]),
        Icon(Icons.star,
            size: 18,
            color: (difficultyLevel >= 4) ? Colors.blue : Colors.blue[100]),
        Icon(Icons.star,
            size: 18,
            color: (difficultyLevel >= 5) ? Colors.blue : Colors.blue[100]),
        Text(
            constDifficutysText.elementAt(difficultyLevel > 0
                ? difficultyLevel > 5
                ? 5
                : difficultyLevel
                : 0),
            style: const TextStyle(color: Colors.blueGrey))
      ],
    );
  }
}
