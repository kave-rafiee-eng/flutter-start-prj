class LcdBuffer {
  final List<bool> buf;
  final int rows;
  final int cols;

  LcdBuffer(this.rows, this.cols) : buf = List<bool>.filled(rows * cols, false);

  int _index(int r, int c) => r * cols + c;

  bool get(int r, int c) => buf[_index(r, c)];

  void set(int r, int c, bool value) {
    buf[_index(r, c)] = value;
  }
}
