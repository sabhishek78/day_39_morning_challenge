// Tower of Hanoi
// https://www.ocf.berkeley.edu/~shidi/cs61a/w/images/f/f8/Hanoi0.png
// Find possible moves for the given state of Hanoi towers
// input: [[3,4],[1,2],[]]
// output: [[[1,3,4],[2],[]], [[3,4],[2],[1]], [[4],[1,2],[3]]]
List<List<List<int>>> result = [];

main() {
  print(possibleMoves([
    [3, 4],
    [1, 2],
    []
  ]));
}

List<List<List<int>>> possibleMoves(List<List<int>> inputList) {
  for (int i = 0; i < inputList.length; i++) {
    for (int j = 0; j < inputList.length; j++) {
      if (validMove(inputList, i, j)) {
        List<List<int>> copyOfInputList = [];
        makeCopy(inputList, copyOfInputList);
        makeMove(copyOfInputList, i, j);
      }
    }
  }
  return result;
}

validMove(List<List<int>> inputList, int i, int j) {
  if (inputList[i].isEmpty) {
    return false;
  } else if (inputList[j].isEmpty) {
    return true;
  } else if (inputList[i][0] < inputList[j][0]) {
    return true;
  } else {
    return false;
  }
}

makeCopy(List<List<int>> inputList, List<List<int>> copyOfInputList) {
  for (int i = 0; i < inputList.length; i++) {
    List<int> temp = List.from(inputList[i]);
    copyOfInputList.add(temp);
  }
}

makeMove(List<List<int>> copyOfInputList, int i, int j) {
  copyOfInputList[j].insert(0, copyOfInputList[i][0]);
  copyOfInputList[i].removeAt(0);

  result.add(copyOfInputList);
}
