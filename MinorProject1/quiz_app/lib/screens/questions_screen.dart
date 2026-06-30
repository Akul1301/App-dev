import 'package:flutter/material.dart';
import 'package:quiz_app/components/answer_button.dart';
import 'package:quiz_app/data/questions.dart';

class QuestionsScreen extends StatefulWidget{
  const QuestionsScreen({super.key, required this.onSelectAnswer});

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionsScreen> createState()=> _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen>{

  var currentQuestionsIndex = 0;

  void answerQuestion(String selectedAnswer){
    widget.onSelectAnswer(selectedAnswer);
    setState(() {
      currentQuestionsIndex++;
    });
  }


  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionsIndex];
    return Center(
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              textAlign: TextAlign.center,
              currentQuestion.text,
              style: const TextStyle(
                fontSize: 24,
                color: Colors.black87,
                fontWeight: FontWeight.bold,
              )),
            const SizedBox(height: 30),
            ...currentQuestion.getShuffledAnswers().map((answer){
              return AnswerButton(text: answer, onTap: (){answerQuestion(answer);},);
            })
            
          ],
        ),
      ),
    );
  }
}