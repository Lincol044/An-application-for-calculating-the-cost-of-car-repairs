import 'package:flutter/material.dart';
import 'screen2.dart';
import 'warehouse.dart';

class Screen1 extends StatefulWidget {
  @override
  _Screen1State createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  String? _selectedBrand;
  String? _selectedModel;
  String? _selectedEngineType;

  final TextEditingController _nameController = TextEditingController();

  bool get _isFormFilled {
    return _selectedBrand != null &&
        _selectedModel != null &&
        _selectedEngineType != null &&
        _nameController.text.isNotEmpty;
  }

  void _navigateToNext() {
    if (_isFormFilled) {
      // Создаем список с данными
      List<String> data = [
        'Имя: ${_nameController.text}',
        'Марка: $_selectedBrand',
        'Модель: $_selectedModel',
        'Тип двигателя: $_selectedEngineType',
      ];
      // Передаем список данных в Screen2
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Screen2(data: data),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Пожалуйста, заполните все поля.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Выбор автомобиля'),
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
              hint: Text('Выберите марку'),
              isExpanded: true,
              items: carBrands.map((String brand) {
                return DropdownMenuItem<String>(
                  value: brand,
                  child: Text(brand),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedBrand = newValue;
                  _selectedModel = null; // Сбросить выбранную модель
                });
              },
            ),
            SizedBox(height: 20),
            Text('Модель автомобиля', style: TextStyle(fontSize: 18)),
            DropdownButton<String>(
              value: _selectedModel,
              hint: Text('Выберите модель'),
              isExpanded: true,
              items: _selectedBrand != null
                  ? modelsByBrand[_selectedBrand]!.map((String model) {
                      return DropdownMenuItem<String>(
                        value: model,
                        child: Text(model),
                      );
                    }).toList()
                  : [],
              onChanged: (String? newValue) {
                setState(() {
                  _selectedModel = newValue;
                });
              },
            ),
            SizedBox(height: 20),
            Text('Тип двигателя', style: TextStyle(fontSize: 18)),
            DropdownButton<String>(
              value: _selectedEngineType,
              hint: Text('Выберите тип двигателя'),
              isExpanded: true,
              items: <String>['Бензин', 'Дизель', 'Электрический']
                  .map((String engineType) {
                return DropdownMenuItem<String>(
                  value: engineType,
                  child: Text(engineType),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedEngineType = newValue;
                });
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _navigateToNext,
              child: Text('Далее'),
            ),
          ],
        ),
      ),
    );
  }
}
