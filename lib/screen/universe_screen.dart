import 'package:flutter/material.dart';
import 'package:game_life/widget/cell_widget.dart';

import '../game_life.dart';

class UniverseScreen extends StatefulWidget {
  const UniverseScreen({Key? key}) : super(key: key);

  @override
  State<UniverseScreen> createState() => _UniverseScreenState();
}

class _UniverseScreenState extends State<UniverseScreen> {
  GameLife gameLife = GameLife();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            children: [
              const SizedBox(height: 40),
              TextButton(
                onPressed: () => setState(() {
                  gameLife.getFirstGeneration();
                }),
                child: const Text('Start Game'),
              ),
              TextButton(
                onPressed: () => setState(() {
                  gameLife.getNextGeneration();
                }),
                child: const Text('Next generation'),
              ),
              TextButton(
                onPressed: () => setState(() {
                  gameLife.resetGame();
                }),
                child: const Text('Reset'),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: gameLife.currentGeneration.map((e) => CellsWidget(cells: e)).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
