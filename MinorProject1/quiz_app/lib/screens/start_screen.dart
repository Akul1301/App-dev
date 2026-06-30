import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget{
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/logo.png',
            width: 250,
          ),
          const SizedBox(height: 30),
          const Text(
            "QUIZ APP",
            style: TextStyle(
              fontSize: 40,
              color: Colors.black87,
            ),
            ),
            const SizedBox(height: 30),
            OutlinedButton.icon(
              icon: const Icon(Icons.arrow_right_alt),
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.black87
              ),
              onPressed: startQuiz, 
              label: Text("START QUIZ")),
            const SizedBox(height: 30),
            OutlinedButton.icon(
              icon: const Icon(Icons.arrow_right_alt),
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.black87
              ),
              onPressed:() {}, 
              label: Text("SWITCH MODE")),
        ],
      ),
    );
  }
}
