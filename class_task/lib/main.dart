import 'package:flutter/material.dart';

void main() {
  runApp( ProfileApp());
}

class ProfileApp extends StatelessWidget {
  //const profile({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Scaffold(
        appBar: AppBar(
          title: Text('Profile'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width:200,
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Text("Akul Malik"),
                  SizedBox(height: 10),
                  Text("App developer"),
                  SizedBox(height: 10),
                  TextButton(
                    onPressed: () {
                      // Handle button press
                    },
                    child: Text("Linkedin"),
                  ),
                ],
                )
            ),
            Container(
              width:200,
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Text("Skills:", style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(height: 10),
                  Text("Flutter"),
                  SizedBox(height: 10),
                  Text("Dart"),
                ],
                )
            ),
          ]
          )
        )
      )
   );
  }
}