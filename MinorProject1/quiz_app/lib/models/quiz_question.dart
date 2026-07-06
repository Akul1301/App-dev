import 'dart:convert'; // Converts raw network string text into readable Map formats
import 'package:http/http.dart' as http; // The execution package

class QuizQuestion {
  final String questionText;
  final List<String> options;
  final int correctAnswerIndex;

  const QuizQuestion({
    required this.questionText, 
    required this.options, 
    required this.correctAnswerIndex,
  });

  List<String> getShuffledAnswers(){
    final shuffleList = List.of(options);
    shuffleList.shuffle();
    return shuffleList;
  }
}



/// Calls the OpenTDB API, parses the JSON payload, and converts it 
/// directly into a list using your existing QuizQuestion architecture.
Future<List<QuizQuestion>> fetchQuizQuestions() async {
  final url = Uri.parse('https://opentdb.com/api.php?amount=10&type=multiple');

  try {
    // 1. Fire the request out to the internet
    final response = await http.get(url);

    // 2. Verify server success status code
    if (response.statusCode == 200) {
      // 3. Decode the raw string text into native nested Maps
      final Map<String, dynamic> decodedData = jsonDecode(response.body);
      final List<dynamic> results = decodedData['results'];

      // 4. Loop through the JSON array and map items to your QuizQuestion class
      return results.map((item) {
        final String parsedQuestionText = item['question'].toString();
        final String correctAnswer = item['correct_answer'].toString();
        final List<String> incorrectAnswers = List<String>.from(item['incorrect_answers']);

        // LOGIC: Combine incorrect answers and the correct answer into your options list
        final List<String> combinedOptions = [...incorrectAnswers, correctAnswer];
        
        // Since your class already has a getShuffledAnswers() method for the UI, 
        // we can keep the base option array static here, but we must know 
        // exactly what index the correct answer lives at inside combinedOptions.
        final int correctIndex = combinedOptions.indexOf(correctAnswer);

        // 5. Pass parameters directly into your unmodified constructor structure
        return QuizQuestion(
          questionText: parsedQuestionText,
          options: combinedOptions,
          correctAnswerIndex: correctIndex,
        );
      }).toList();
    } else {
      throw Exception('Server error status code: ${response.statusCode}');
    }
  } catch (error) {
    throw Exception('Failed to connect to network service: $error');
  }
}