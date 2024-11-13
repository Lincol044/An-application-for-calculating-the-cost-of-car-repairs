import 'package:flutter/material.dart';
import 'warehouse.dart';

class EditScreen extends StatefulWidget {
  final int dataIndex;

  EditScreen({required this.dataIndex});

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

    // Инициализируем контроллеры и переменные данными из carData
    _nameController = TextEditingController(
        text: carData[widget.dataIndex][0].split(': ')[1]);
    _selectedBrand = carData[widget.dataIndex][1].split(': ')[1];
    _selectedModel = carData[widget.dataIndex][2].split(': ')[1];
    _selectedEngineType = carData[widget.dataIndex][3].split(': ')[1];
  }

  void _saveData() {
    // Обновляем данные в глобальном массиве
    setState(() {
      carData[widget.dataIndex] = [
        'Имя: ${_nameController.text}',
        'Марка: $_selectedBrand',
        'Модель: $_selectedModel',
        'Тип двигателя: $_selectedEngineType',
      ];
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Данные обновлены!')),
    );

    // Возвращаемся на предыдущий экран
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Редактирование данных'),
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
                  _selectedModel = modelsByBrand[_selectedBrand]![0];
                });
              },
            ),
            SizedBox(height: 20),
            Text('Модель автомобиля', style: TextStyle(fontSize: 18)),
            DropdownButton<String>(
              value: _selectedModel,
              items: modelsByBrand[_selectedBrand]!.map((String model) {
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
