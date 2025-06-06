class BoardLogic {
  final int rows = 6;
  final int cols = 7;
  late List<List<String>> grid;

  BoardLogic() {
    resetBoard();
  }

  void resetBoard() {
    grid = List.generate(rows, (_) => List.generate(cols, (_) => '_'));
  }

  bool setCoin(int col, String coin) {
    for (int row = rows - 1; row >= 0; row--) {
      if (grid[row][col] == '_') {
        grid[row][col] = coin;
        return true;
      }
    }
    return false;
  }

  bool checkWin(String coin) {
    // Horizontal
    for (int row = 0; row < rows; row++) {
      for (int col = 0; col < cols - 3; col++) {
        if (grid[row][col] == coin &&
            grid[row][col + 1] == coin &&
            grid[row][col + 2] == coin &&
            grid[row][col + 3] == coin) {
          return true;
        }
      }
    }

    // Vertical
    for (int col = 0; col < cols; col++) {
      for (int row = 0; row < rows - 3; row++) {
        if (grid[row][col] == coin &&
            grid[row + 1][col] == coin &&
            grid[row + 2][col] == coin &&
            grid[row + 3][col] == coin) {
          return true;
        }
      }
    }

    // Diagonal (bottom-left to top-right)
    for (int row = 3; row < rows; row++) {
      for (int col = 0; col < cols - 3; col++) {
        if (grid[row][col] == coin &&
            grid[row - 1][col + 1] == coin &&
            grid[row - 2][col + 2] == coin &&
            grid[row - 3][col + 3] == coin) {
          return true;
        }
      }
    }

    // Diagonal (top-left to bottom-right)
    for (int row = 0; row < rows - 3; row++) {
      for (int col = 0; col < cols - 3; col++) {
        if (grid[row][col] == coin &&
            grid[row + 1][col + 1] == coin &&
            grid[row + 2][col + 2] == coin &&
            grid[row + 3][col + 3] == coin) {
          return true;
        }
      }
    }

    return false;
  }
}
