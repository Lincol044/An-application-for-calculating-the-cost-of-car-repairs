import 'package:flutter/material.dart';
import 'warehouse.dart';
import 'EditScreen.dart';

class Screen2 extends StatefulWidget {
  @override
  _Screen2State createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  void _editData(int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditScreen(dataIndex: index),
      ),
    ).then((value) {
      setState(
          () {}); // Обновляем экран после возвращения с экрана редактирования
    });
  }

  void _addNewData() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditScreen(),
      ),
    ).then((value) {
      setState(() {}); // Обновляем экран после возвращения с экрана добавления
    });
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
          );
        },
      ),
    );
  }
}

class EditScreen extends StatefulWidget {
  final int? dataIndex;

  EditScreen({this.dataIndex}); // Добавляем параметр для индекса данных

  @override
  _EditScreenState createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  late TextEditingController _nameController;
  late String _selectedBrand;
  late String _selectedModel;
  late String _selectedEngineType;

  @override
  void initState() {
    super.initState();

    if (widget.dataIndex != null) {
      // Если индекс данных передан, инициализируем контроллеры и переменные с существующими данными
      _nameController = TextEditingController(
          text: carData[widget.dataIndex!][0].split(': ')[1]);
      _selectedBrand = carData[widget.dataIndex!][1].split(': ')[1];
      _selectedModel = carData[widget.dataIndex!][2].split(': ')[1];
      _selectedEngineType = carData[widget.dataIndex!][3].split(': ')[1];
    } else {
      // Иначе инициализируем пустыми значениями для добавления новой записи
      _nameController = TextEditingController();
      _selectedBrand = carBrands[0];
      _selectedModel = modelsByBrand[_selectedBrand]![0];
      _selectedEngineType = 'Бензин';
    }
  }

  void _saveData() {
    if (widget.dataIndex != null) {
      // Обновляем существующие данные
      setState(() {
        carData[widget.dataIndex!] = [
          'Имя: ${_nameController.text}',
          'Марка: $_selectedBrand',
          'Модель: $_selectedModel',
          'Тип двигателя: $_selectedEngineType',
        ];
      });
    } else {
      // Добавляем новые данные
      setState(() {
        carData.add([
          'Имя: ${_nameController.text}',
          'Марка: $_selectedBrand',
          'Модель: $_selectedModel',
          'Тип двигателя: $_selectedEngineType',
        ]);
      });
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Данные сохранены!')),
    );

    Navigator.pop(context); // Возвращаемся на предыдущий экран
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.dataIndex != null
            ? 'Редактирование данных'
            : 'Добавление данных'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Имя', style: TextStyle(fontSize: 18)),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(hintText: 'Введите ваше имя'),
            ),
            SizedBox(height: 20),
            Text('Марка автомобиля', style: TextStyle(fontSize: 18)),
            DropdownButton<String>(
              value: _selectedBrand,
              items: carBrands.map((String brand) {
                return DropdownMenuItem<String>(
                  value: brand,
                  child: Text(brand),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedBrand = newValue!;
                  _selectedModel = modelsByBrand[_selectedBrand]![
                      0]; // Обновляем модель при изменении марки
                });
              },
            ),
            SizedBox(height: 20),
            Text('Модель автомобиля', style: TextStyle(fontSize: 18)),
            DropdownButton<String>(
              value: _selectedModel,
              items: modelsByBrand[_selectedBrand]?.map((String model) {
                return DropdownMenuItem<String>(
                  value: model,
                  child: Text(model),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedModel = newValue!;
                });
              },
            ),
            SizedBox(height: 20),
            Text('Тип двигателя', style: TextStyle(fontSize: 18)),
            DropdownButton<String>(
              value: _selectedEngineType,
              items: ['Бензин', 'Дизель', 'Электро'].map((String type) {
                return DropdownMenuItem<String>(
                  value: type,
                  child: Text(type),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedEngineType = newValue!;
                });
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveData,
              child: Text('Сохранить'),
            ),
          ],
        ),
      ),
    );
  }
}
