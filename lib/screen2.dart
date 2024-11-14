import 'package:flutter/material.dart';
import 'warehouse.dart'; // Импортируйте файл с данными о машинах
import 'editScreen.dart'; // Импортируйте экран для редактирования данных
import 'car_details_screen.dart'; // Импортируйте экран для деталей автомобиля

class Screen2 extends StatefulWidget {
  @override
  _Screen2State createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  get dataIndex => null;

  void _editData(int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            EditScreen(dataIndex: index), // Передаем индекс для редактирования
      ),
    ).then((value) {
      setState(() {}); // Обновляем экран после возврата с экрана редактирования
    });
  }

  void _addNewData() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditScreen(
            dataIndex: dataIndex), // Измените на ваш экран для добавления
      ),
    ).then((value) {
      setState(() {}); // Обновляем экран после возврата с экрана добавления
    });
  }

  void _viewDetails(int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CarDetailsScreen(
            car: carData[index]), // Передаем выбранный автомобиль
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Список данных'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: _addNewData, // Кнопка для добавления новых данных
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: carData.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Данные об автомобиле ${index + 1}'),
            subtitle: Text(carData[index].join('\n')),
            onTap: () => _editData(index), // Редактирование данных
            trailing: IconButton(
              icon: Icon(Icons.info),
              onPressed: () => _viewDetails(index), // Показать детали
            ),
          );
        },
      ),
    );
  }
}
