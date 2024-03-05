import 'package:flutter/material.dart';
import 'data/questions.dart';

class Result extends StatelessWidget {
  const Result(this.selectedAns, this.restart, {super.key});

  final List<String> selectedAns;
  final Function() restart;

  List<Map<String, Object>> getSummary(){
    final List<Map<String,Object>> summary = [];
    for(var i = 0; i < selectedAns.length; i++){
      summary.add({
        'Question index':i,
        'Question':questions[i].text,
        'Correct answer':questions[i].answers[0],
        'User answer':selectedAns[i]
      });
    }
    return summary;
  }


  @override
  Widget build(BuildContext context) {

    final summary = getSummary();
    var correctAns = 0;
    for(var i = 0; i < selectedAns.length; i++){
      if(summary[i]['User answer'] == summary[i]['Correct answer']){
        correctAns++;
      }
    }

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('You answered $correctAns from ${questions.length}', style:
            const TextStyle(fontSize: 24,color: Colors.white),),
            const SizedBox(height: 30,),
            ...getSummary().map((e) => Column(
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: e['User answer'] == e['Correct answer'] ?
                      Colors.green : Colors.red,
                        child: Text(((e['Question index'] as int) + 1).toString())),
                    const SizedBox(width: 20,),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(e['Question'].toString(),style: const TextStyle(color: Colors.white),),
                          Text(e['User answer'].toString(),style: TextStyle(color:
                          e['User answer'] == e['Correct answer'] ?
                          Colors.green : Colors.red),),
                          Text(e['Correct answer'].toString(),style: const TextStyle(color: Colors.blue),),
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 20,),
              ],
            )),
            const SizedBox(height: 30,),
            TextButton(onPressed: restart, child: const Row(
              children: [
                Icon(Icons.restart_alt_sharp,color: Colors.white,),
                Text("Restart quiz",
                style: TextStyle(color: Colors.white),),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
