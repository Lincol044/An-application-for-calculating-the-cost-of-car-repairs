import 'package:flutter/material.dart';

class CarDetailsScreen extends StatefulWidget {
  final List<String> car; // Предполагаем, что carData передает список строк

  CarDetailsScreen({required this.car});

  @override
  _CarDetailsScreenState createState() => _CarDetailsScreenState();
}

class _CarDetailsScreenState extends State<CarDetailsScreen> {
  late String _engineType;
  late String _transmissionType;
  late String _chassisType;
  late String _fuelSystem;
  late String _bodyType;
  late String _seatType;
  late String _doorType;
  late String _dashboardType;

  // Примеры опций для каждого поля
  final List<String> engineOptions = [
    'Бензиновый',
    'Дизельный',
    'Электрический'
  ];
  final List<String> transmissionOptions = ['Автоматическая', 'Механическая'];
  final List<String> chassisOptions = ['Передний', 'Задний', 'Полный'];
  final List<String> fuelSystemOptions = ['Инжектор', 'Карбюратор'];
  final List<String> bodyOptions = ['Седан', 'Хэтчбек', 'Универсал'];
  final List<String> seatOptions = ['Тканевые', 'Кожаные'];
  final List<String> doorOptions = ['2 двери', '4 двери'];
  final List<String> dashboardOptions = ['Цифровая', 'Аналоговая'];

  @override
  void initState() {
    super.initState();

    // Инициализируем значения по умолчанию
    _engineType = widget.car.length > 4 ? widget.car[4] : engineOptions[0];
    _transmissionType =
        widget.car.length > 5 ? widget.car[5] : transmissionOptions[0];
    _chassisType = widget.car.length > 6 ? widget.car[6] : chassisOptions[0];
    _fuelSystem = widget.car.length > 7 ? widget.car[7] : fuelSystemOptions[0];
    _bodyType = widget.car.length > 8 ? widget.car[8] : bodyOptions[0];
    _seatType = widget.car.length > 9 ? widget.car[9] : seatOptions[0];
    _doorType = widget.car.length > 10 ? widget.car[10] : doorOptions[0];
    _dashboardType =
        widget.car.length > 11 ? widget.car[11] : dashboardOptions[0];
  }

  void _showOptions(
      String title, List<String> options, ValueChanged<String> onChanged) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return ListView.builder(
          itemCount: options.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(options[index]),
              onTap: () {
                onChanged(options[index]);
                Navigator.pop(context); // Закрыть модальное окно
              },
            );
          },
        );
      },
    );
  }

  void _saveDetails() {
    // Здесь можно добавить логику для сохранения деталей
    setState(() {
      // Обновляем данные в массиве car
      if (widget.car.length > 4) {
        widget.car[4] = _engineType; // Двигатель/Система охлаждения
        if (widget.car.length > 5)
          widget.car[5] = _transmissionType; // Коробка передач
        if (widget.car.length > 6)
          widget.car[6] = _chassisType; // Ходовая часть
        if (widget.car.length > 7)
          widget.car[7] = _fuelSystem; // Топливная система
        if (widget.car.length > 8) widget.car[8] = _bodyType; // Кузов
        if (widget.car.length > 9) widget.car[9] = _seatType; // Сиденья
        if (widget.car.length > 10) widget.car[10] = _doorType; // Двери
        if (widget.car.length > 11)
          widget.car[11] = _dashboardType; // Панель приборов
      }
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Детали обновлены!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Детали автомобиля'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () => _showOptions(
                  'Двигатель/Система охлаждения', engineOptions, (value) {
                setState(() {
                  _engineType = value;
                });
              }),
              child: Text('Двигатель/Система охлаждения: $_engineType',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ),
            SizedBox(height: 10),
            GestureDetector(
              onTap: () =>
                  _showOptions('Коробка передач', transmissionOptions, (value) {
                setState(() {
                  _transmissionType = value;
                });
              }),
              child: Text('Коробка передач: $_transmissionType',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ),
            SizedBox(height: 10),
            GestureDetector(
              onTap: () =>
                  _showOptions('Ходовая часть', chassisOptions, (value) {
                setState(() {
                  _chassisType = value;
                });
              }),
              child: Text('Ходовая часть: $_chassisType',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ),
            SizedBox(height: 10),
            GestureDetector(
              onTap: () => _showOptions(
                  'Топливная система/Система выпуска газа', fuelSystemOptions,
                  (value) {
                setState(() {
                  _fuelSystem = value;
                });
              }),
              child: Text(
                  'Топливная система/Система выпуска газа: $_fuelSystem',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ),
            SizedBox(height: 10),
            GestureDetector(
              onTap: () => _showOptions('Кузов', bodyOptions, (value) {
                setState(() {
                  _bodyType = value;
                });
              }),
              child: Text('Кузов: $_bodyType',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ),
            SizedBox(height: 10),
            GestureDetector(
              onTap: () => _showOptions('Сиденья', seatOptions, (value) {
                setState(() {
                  _seatType = value;
                });
              }),
              child: Text('Сиденья: $_seatType',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ),
            SizedBox(height: 10),
            GestureDetector(
              onTap: () => _showOptions('Двери', doorOptions, (value) {
                setState(() {
                  _doorType = value;
                });
              }),
              child: Text('Двери: $_doorType',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ),
            SizedBox(height: 10),
            GestureDetector(
              onTap: () => _showOptions(
                  'Панель приборов/Система вентиляции', dashboardOptions,
                  (value) {
                setState(() {
                  _dashboardType = value;
                });
              }),
              child: Text('Панель приборов/Система вентиляции: $_dashboardType',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveDetails,
              child: Text('Сохранить детали'),
            ),
          ],
        ),
      ),
    );
  }
}
