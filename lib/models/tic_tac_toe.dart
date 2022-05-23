enum Marks { none, cross, nought }

class TicTacToe {
  Marks _winner = Marks.none;
  bool _inProgress = true;
  int _stepCounter = 0;

  final _field = [
    [
      Marks.none,
      Marks.none,
      Marks.none,
    ],
    [
      Marks.none,
      Marks.none,
      Marks.none,
    ],
    [
      Marks.none,
      Marks.none,
      Marks.none,
    ],
  ];

  Marks doStep(int row, int column) {
    if (_inProgress == false) {
      throw 'Game is done. you can get winner now';
    }
    if (row < 0 || row > 2 || column > 2 || column < 0) {
      throw ArgumentError('0 <= row, column <= 2');
    }
    if (_field[row][column] != Marks.none) {
      throw 'Field is occupied';
    }
    if (_stepCounter == 9) {
      _inProgress = false;
      throw 'No more free fields';
    }
    var result = _stepCounter.isEven ? Marks.cross : Marks.nought;
    _stepCounter++;
    _field[row][column] = result;
    _checkForWinner();
    return (result);
  }

  get winner {
    if (_inProgress) {
      throw 'Game is in progress';
    }
    return _winner;
  }

  void _checkForWinner() {
    for (var row in _field) {
      if (row[0] == row[1] && row[1] == row[2]) {
        _winner = _field[0][0];
        _inProgress = false;
        return;
      }
    }
    for (var i = 0; i < 2; i++) {
      if (_field[0][i] == _field[1][i] && _field[1][i] == _field[2][i]) {
        _winner = _field[0][i];
        _inProgress = false;
        return;
      }
    }
  }
}
