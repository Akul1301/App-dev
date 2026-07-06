import 'dart:convert'; // Converts raw network string text into readable Map formats
import 'package:http/http.dart' as http; // The execution package



class QuizQuestion {

  final String questionText;
  final List<String> options;
  final int correctAnswerIndex;
  final String category;

  const QuizQuestion({required this.questionText, required this.options, required this.correctAnswerIndex, required this.category});


  List<String> getShuffledAnswers(){
    final shuffleList = List.of(answers);
    shuffleList.shuffle();
    return shuffleList;
  }
}