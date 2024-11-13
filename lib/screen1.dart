import 'package:flutter/material.dart';
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
  final TextEditingController _yearController = TextEditingController();
  final TextEditingController _mileageController = TextEditingController();
  final TextEditingController _licensePlateController = TextEditingController();
  final TextEditingController _vinController = TextEditingController();
  final TextEditingController _colorController = TextEditingController();
  final TextEditingController _engineVolumeController = TextEditingController();
  final TextEditingController _enginePowerController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool get _isFormFilled {
    return _formKey.currentState?.validate() ?? false;
  }

  void _saveData() {
    if (_isFormFilled) {
      // Создаем список с данными и добавляем его в глобальный массив
      List<String> data = [
        'Имя: ${_nameController.text}',
        'Марка: $_selectedBrand',
        'Модель: $_selectedModel',
        'Тип двигателя: $_selectedEngineType',
        'Год выпуска: ${_yearController.text}',
        'Пробег: ${_mileageController.text}',
        'Гос. номер: ${_licensePlateController.text}',
        'VIN номер: ${_vinController.text}',
        'Цвет кузова: ${_colorController.text}',
        'Объем двигателя: ${_engineVolumeController.text}',
        'Мощность двигателя: ${_enginePowerController.text} л.с',
      ];
      carData.add(data); // Добавляем данные в глобальный массив

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Данные сохранены!')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Пожалуйста, заполните все поля корректно.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Выбор автомобиля'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Имя', style: TextStyle(fontSize: 18)),
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(hintText: 'Введите ваше имя'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Пожалуйста, введите ваше имя';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                Text('Марка автомобиля', style: TextStyle(fontSize: 18)),
                DropdownButtonFormField<String>(
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
                      _selectedModel = null;
                    });
                  },
                  validator: (value) {
                    if (value == null) {
                      return 'Пожалуйста, выберите марку автомобиля';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                Text('Модель автомобиля', style: TextStyle(fontSize: 18)),
                DropdownButtonFormField<String>(
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
                  validator: (value) {
                    if (value == null) {
                      return 'Пожалуйста, выберите модель автомобиля';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                Text('Тип двигателя', style: TextStyle(fontSize: 18)),
                DropdownButtonFormField<String>(
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
                  validator: (value) {
                    if (value == null) {
                      return 'Пожалуйста, выберите тип двигателя';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),

                // Новые поля ввода с валидацией
                Text('Год выпуска', style: TextStyle(fontSize: 18)),
                TextFormField(
                  controller: _yearController,
                  decoration: InputDecoration(hintText: 'Введите год выпуска'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Пожалуйста, введите год выпуска';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                Text('Пробег', style: TextStyle(fontSize: 18)),
                TextFormField(
                  controller: _mileageController,
                  decoration: InputDecoration(hintText: 'Введите пробег (км)'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Пожалуйста, введите пробег';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                Text('Гос. номер', style: TextStyle(fontSize: 18)),
                TextFormField(
                  controller: _licensePlateController,
                  decoration: InputDecoration(hintText: 'Введите гос. номер'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Пожалуйста, введите гос. номер';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                Text('VIN номер', style: TextStyle(fontSize: 18)),
                TextFormField(
                  controller: _vinController,
                  decoration: InputDecoration(hintText: 'Введите VIN номер'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Пожалуйста, введите VIN номер';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                Text('Цвет кузова', style: TextStyle(fontSize: 18)),
                TextFormField(
                  controller: _colorController,
                  decoration: InputDecoration(hintText: 'Введите цвет кузова'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Пожалуйста, введите цвет кузова';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                Text('Объем двигателя', style: TextStyle(fontSize: 18)),
                TextFormField(
                  controller: _engineVolumeController,
                  decoration:
                      InputDecoration(hintText: 'Введите объем двигателя (л)'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Пожалуйста, введите объем двигателя';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                Text('Мощность двигателя', style: TextStyle(fontSize: 18)),
                TextFormField(
                  controller: _enginePowerController,
                  decoration: InputDecoration(
                      hintText: 'Введите мощность двигателя (л.с)'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Пожалуйста, введите мощность двигателя';
                    }
                    return null;
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
        ),
      ),
    );
  }
}
