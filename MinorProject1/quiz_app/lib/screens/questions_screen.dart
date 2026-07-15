import 'package:flutter/material.dart';
import 'package:quiz_app/components/answer_button.dart';
import 'package:quiz_app/data/questions.dart'; // Imports apiQuestionsFuture
import 'package:quiz_app/models/quiz_question.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onSelectAnswer});

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionsIndex = 0;

  void answerQuestion(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);
    setState(() {
      currentQuestionsIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // LOGIC: We pass our global API variable into the FutureBuilder engine
    return FutureBuilder<List<QuizQuestion>>(
      future: questions, // <-- This is the Future that will resolve into a List<QuizQuestion>
      builder: (context, snapshot) {
        
        // 1. Handle the active downloading state
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        // 2. Handle network failure states safely
        if (snapshot.hasError) {
          return Center(
            child: Text('Error loading questions: ${snapshot.error}'),
          );
        }

        // 3. Extract the clean question list once it arrives from the web
        final fetchedQuestions = snapshot.data!;

        // LOGIC: Prevents index crashes if the user answers all questions
        if (currentQuestionsIndex >= fetchedQuestions.length) {
          return const Center(
            child: Text('Quiz completed! Processing results...'),
          );
        }

        // Read the current live question from the freshly parsed list
        final currentQuestion = fetchedQuestions[currentQuestionsIndex];

        return Center(
          child: Container(
            margin: const EdgeInsets.all(40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  currentQuestion.questionText, // Uses your exact property name
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 24,
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 30),
                
                // Maps over your unmodified getShuffledAnswers logic
                ...currentQuestion.getShuffledAnswers().map((answer) {
                  return AnswerButton(
                    text: answer,
                    onTap: () {
                      answerQuestion(answer);
                    },
                  );
                }),
              ],
            ),
          ),
        );
      },
    );
  }
}