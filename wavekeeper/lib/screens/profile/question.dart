import 'package:flutter/material.dart';


class QuestionsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Frequently Asked Questions'),
      ),
      body: Center(
        child: Text(
          'This is the Frequently Asked Questions page',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
