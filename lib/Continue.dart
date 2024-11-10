import 'package:flutter/material.dart';
import 'MainScreen.dart';

class ContinueScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Переход на основной экран приложения
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => MainScreen()),
            );
          },
          child: Text('Продолжить'),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.pink,
            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
          ),
        ),
      ),
    );
  }
}
