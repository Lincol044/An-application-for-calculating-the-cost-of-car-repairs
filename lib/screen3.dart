import 'package:flutter/material.dart';

class Screen3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Экран 3'),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Text(
          'Это экран 3',
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),
    );
  }
}
