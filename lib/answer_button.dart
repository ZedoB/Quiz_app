import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  const Answer(this.text, this.onPressed, {super.key});

  final String text;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue,
        padding: const EdgeInsets.all(30),
      ),
        onPressed: onPressed, child: Text(text,textAlign: TextAlign.center,));
  }
}
