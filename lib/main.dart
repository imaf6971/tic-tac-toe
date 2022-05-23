import 'package:flutter/material.dart';
import 'package:ttt/models/tic_tac_toe.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: TicTacToeWidget(),
    );
  }
}

class TicTacToeWidget extends StatefulWidget {
  const TicTacToeWidget({Key? key}) : super(key: key);

  @override
  State<TicTacToeWidget> createState() => _TicTacToeWidgetState();
}

class _TicTacToeWidgetState extends State<TicTacToeWidget> {
  final fields = List.generate(9, (index) => const Icon(null));
  
  final marksIcons = {
    Marks.cross: const Icon(
      Icons.android,
      size: 100,
    ),
    Marks.nought: const Icon(
      Icons.apple,
      size: 100,
    ),
    Marks.none: const Icon(null),
  };

  final ticTacToe = TicTacToe();

  _doStep(int fieldIndex) {
    setState(() {
      var mark = ticTacToe.doStep(9 ~/ fieldIndex, 9 % fieldIndex);
      var icon = marksIcons[mark];
      fields[fieldIndex] = icon!;
    });
  }

  _getStepFunction(int fieldIndex) {
    if (fields[fieldIndex].icon != null) {
      return null;
    }
    return () => _doStep(fieldIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Tic Tac Toe',
        ),
      ),
      body: GridView.count(
        crossAxisCount: 3,
        children: List.generate(9, (index) {
          return Container(
            margin: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.blue),
              borderRadius: BorderRadius.circular(20),
            ),
            child: IconButton(
              onPressed: _getStepFunction(index), // _changeState(index),
              icon: fields[index],
            ),
          );
        }),
      ),
    );
  }
}
