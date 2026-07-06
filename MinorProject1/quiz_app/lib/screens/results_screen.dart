import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';

class ResultsScreen extends StatelessWidget{
  const ResultsScreen({super.key});



  @override
  Widget build(BuildContext context) {
    
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('You answered X of Y questions correctly'),
          const SizedBox(height: 30),
          OutlinedButton.icon(
            style:OutlinedButton.styleFrom(foregroundColor: Colors.black87),
            icon: const Icon(Icons.restart_alt),
            onPressed: (){}, 
            label: Text("Go to Start Page")),
        ],
      ),
    );
  }
}