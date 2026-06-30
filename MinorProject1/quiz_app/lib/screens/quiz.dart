import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/screens/questions_screen.dart';
import 'package:quiz_app/screens/results_screen.dart';
import 'package:quiz_app/screens/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswer = [];


  var activeScreen='start-screen';
  
  void switchScreen() {
    setState(() {
      activeScreen='questions-screen';
    });
  }

  void chooseAnswer(String answer){
    selectedAnswer.add(answer);

    if (selectedAnswer.length == questions.length){
      setState(() {
        selectedAnswer=[];
        activeScreen = 'results-screen';
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen=='questions-screen'){
      screenWidget= QuestionsScreen(onSelectAnswer: chooseAnswer);
    }

    if (activeScreen=='results-screen'){
      screenWidget= const ResultsScreen();
    }
   
    // final screenWidget = activeScreen == 'start-screen'? StartScreen(switchScreen):const QuestionsScreen();


    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Scaffold(
        body:Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.black,
                Colors.blueAccent,
                Colors.black,
              ]
            ),
          ),
        child: screenWidget,
        ),
      ),
    );
  }
}