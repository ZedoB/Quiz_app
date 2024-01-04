import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  Home(this.switchScreen, {super.key});

  final void Function() switchScreen;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset("assets/images/quiz-logo.png",width: 300,),
          const SizedBox(height: 80,),
          const Text("Learn flutter",style: TextStyle(fontSize: 25,color: Colors.white),),
          const SizedBox(height: 50,),
          OutlinedButton.icon(
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white
            ),
              onPressed: switchScreen, label: const Text("Start quiz"),
          icon: Icon(Icons.arrow_right_alt_outlined),)
        ],
      ),
    );
  }
}
