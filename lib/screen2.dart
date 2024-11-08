import 'package:flutter/material.dart';

class Screen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Экран 2'),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Text(
          'Это экран 2',
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),
    );
  }
}
