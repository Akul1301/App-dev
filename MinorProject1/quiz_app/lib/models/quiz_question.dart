class QuizQuestion {

  final String text;
  final List<String> answers;

  const QuizQuestion({required this.text, required this.answers});


  List<String> getShuffledAnswers(){
    final shuffleList = List.of(answers);
    shuffleList.shuffle();
    return shuffleList;
  }
}