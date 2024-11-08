import 'package:flutter/material.dart';

class Screen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ввод данных'),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Поле ввода для марки автомобиля
            Text('Марка автомобиля', style: TextStyle(fontSize: 18)),
            TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[800],
                border: OutlineInputBorder(),
                labelText: 'Введите марку',
                labelStyle: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(height: 16),

            // Поле ввода для модели автомобиля
            Text('Модель автомобиля', style: TextStyle(fontSize: 18)),
            TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[800],
                border: OutlineInputBorder(),
                labelText: 'Введите модель',
                labelStyle: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(height: 16),

            // Поле ввода для группы работ
            Text('Группа работ', style: TextStyle(fontSize: 18)),
            TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[800],
                border: OutlineInputBorder(),
                labelText: 'Введите группу работ',
                labelStyle: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(height: 16),

            // Надпись "Вид работ"
            Text('Вид работ', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),

            // Кнопка "Добавить в расчет стоимости"
            ElevatedButton(
              onPressed: () {
                // Действие при нажатии на кнопку
                print('Добавлено в расчет стоимости');
              },
              child: Text('Добавить в расчет стоимости'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black, // Цвет фона кнопки
                foregroundColor: Colors.white, // Цвет текста кнопки
              ),
            ),
          ],
        ),
      ),
    );
  }
}
