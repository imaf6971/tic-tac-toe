import 'package:flutter/material.dart';

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
  int stepCounter = 0;

  _doStep(int fieldIndex) {
    setState(() {
      if (stepCounter.isEven) {
        fields[fieldIndex] = const Icon(
          Icons.apple,
          size: 100,
        );
      } else {
        fields[fieldIndex] = const Icon(
          Icons.android,
          size: 100,
        );
      }
      stepCounter++;
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
