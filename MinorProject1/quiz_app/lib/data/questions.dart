import 'package:quiz_app/models/quiz_question.dart';

// LOGIC: This variable now explicitly holds the background network promise.
// It will eventually resolve into a List containing your QuizQuestion objects.
final Future<List<QuizQuestion>> questions = fetchQuizQuestions();