class Cell {
  final bool isAlive;

  Cell(this.isAlive);
  @override
  String toString() {
    return isAlive ? '1' : '0';
  }
}
