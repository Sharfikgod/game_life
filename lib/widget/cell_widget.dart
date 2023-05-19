import 'package:flutter/material.dart';
import '../model/cell.dart';

class CellsWidget extends StatelessWidget {
  final List<Cell> cells;
  const CellsWidget({
    Key? key,
    required this.cells,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: cells
          .map<Widget>((e) => Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  color: e.isAlive ? Colors.black : Colors.white,
                  border: Border.all(width: 1, color: Colors.grey),
                ),
              ))
          .toList(),
    );
  }
}
