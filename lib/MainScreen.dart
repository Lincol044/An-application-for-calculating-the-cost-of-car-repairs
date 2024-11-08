import 'package:flutter/material.dart';
import 'screen1.dart';
import 'screen2.dart';
import 'screen3.dart';
import 'screen4.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Экран навигации в приложении'),
        backgroundColor: Colors.black,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Добавляем GIF-файл
          Image.asset(
            'assets/gifimage2.gif',
            height: 500, // Установите высоту по необходимости
            width: 3000, // Установите ширину по необходимости
            fit: BoxFit.cover, // Масштабирование изображения
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () {
                  // Навигация к экрану 1
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Screen1()),
                  );
                },
                icon: Icon(Icons.person), // Иконка для Кнопки 1
                color: Colors.pink,
                iconSize: 50, // Размер иконки
              ),
              IconButton(
                onPressed: () {
                  // Навигация к экрану 2
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Screen2()),
                  );
                },
                icon: Icon(Icons.drive_eta), // Иконка для Кнопки 2
                color: Colors.pink,
                iconSize: 50, // Размер иконки
              ),
              IconButton(
                onPressed: () {
                  // Навигация к экрану 3
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Screen3()),
                  );
                },
                icon: Icon(Icons.settings), // Иконка для Кнопки 3
                color: Colors.pink,
                iconSize: 50, // Размер иконки
              ),
              IconButton(
                onPressed: () {
                  // Навигация к экрану 4
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Screen4()),
                  );
                },
                icon: Icon(Icons.settings), // Иконка для Кнопки 4
                color: Colors.pink,
                iconSize: 50, // Размер иконки
              ),
            ],
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
