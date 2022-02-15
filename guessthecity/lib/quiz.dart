class Quiz {
  int _totalScore = 0;
  int _questionIndex = 0;
  int get questionIndex => _questionIndex;
  int get totalScore => _totalScore;
  correctFunc() {
    _totalScore++;
    _questionIndex++;
  }

  wrongFunc() {
    _questionIndex++;
  }

  resetCounter() {
    _totalScore = 0;
    _questionIndex = 0;
  }
}
