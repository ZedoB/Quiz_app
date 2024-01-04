import 'package:flutter/material.dart';
import 'data/questions.dart';
import 'answer_button.dart';

class Question extends StatefulWidget {
  const Question(this.onSelectedAns, {super.key});

  final void Function(String) onSelectedAns;

  @override
  State<Question> createState() => _QuestionState();
}

class _QuestionState extends State<Question> {

  var currentQuesIndex = 0;
  void ansQues(String ans){
    widget.onSelectedAns(ans);
    setState(() {
      currentQuesIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQues = questions[currentQuesIndex];
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(currentQues.text,style:
          const TextStyle(fontSize: 24,color: Colors.white),),
          const SizedBox(height: 30,),
          
          ... currentQues.getShuffledAnswers().map((e) {
            return Container(
              margin: const EdgeInsets.all(10),
                child: Answer(e,() => ansQues(e))
            );
          }),
        ],
      ),
    );
  }
}
