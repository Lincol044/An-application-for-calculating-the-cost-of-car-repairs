import 'package:flutter/material.dart';

class Screen4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Экран 4'),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Text(
          'Это экран 4',
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),
    );
  }
}
