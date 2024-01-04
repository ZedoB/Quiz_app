import 'package:flutter/material.dart';
import 'package:quiz/question.dart';
import 'package:quiz/result.dart';
import 'data/questions.dart';
import 'home.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {

  List<String> selectedAns = [];
  Widget? activeScreen;

  void chooseAns(String ans){
    selectedAns.add(ans);
    if(selectedAns.length == questions.length){
      setState(() {
        activeScreen = Result(selectedAns, restart);
      });
    }
  }

  void restart(){
    setState(() {
      selectedAns = [];
      activeScreen = Home(switchScreen);
    });
  }

  @override
  void initState() {
    super.initState();
    activeScreen = Home(switchScreen);
  }

  void switchScreen(){
    setState(() {
      activeScreen = Question(chooseAns);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(colors:
                [Colors.deepPurpleAccent,Colors.purpleAccent])
            ),
            child: activeScreen),
      ),
    );
  }
}
