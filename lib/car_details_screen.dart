import 'package:flutter/material.dart';

class CarDetailsScreen extends StatefulWidget {
  final List<String> car;

  CarDetailsScreen({required this.car});

  @override
  _CarDetailsScreenState createState() => _CarDetailsScreenState();
}

class _CarDetailsScreenState extends State<CarDetailsScreen> {
  Map<String, String> selectedParts = {};
  Map<String, Map<String, double>> partsOptions = {
    'Двигатель': {
      'Все исправно': 0,
      'поршневые кольца, поршни и пальцы в комплекте': 1500.0,
      'комплект шатунных и коренных вкладышей': 2000.0,
      'комплект свечей зажигания': 4000.0,
      'ремни ГРМ': 3000.0,
      'вакуумный шланг': 1500.0,
      'сальники, клапаны': 2000.0,
      'масляный и воздушный фильтр по 1шт': 7000.0,
    },
    'Коробка передач': {
      'Все исправно': 0,
      'МКППИнструментальная и визуальная диагностика': 1200.0,
      'МКППДемонтаж': 800.0,
      'МКПППромывка и дефектовка': 1200.0,
      'МКППЗапись неисправностей в ведомость.': 1200.0,
      'МКППСоставление сметы': 1200.0,
      'МКППЗамена деталей, которые невозможно восстановить.': 1200.0,
      'АКППИнструментальная и визуальная диагностика': 1200.0,
      'АКППДемонтаж': 800.0,
      'АКПППромывка и дефектовка': 1200.0,
      'АКППЗапись неисправностей в ведомость.': 1200.0,
      'АКППСоставление сметы': 1200.0,
      'АКППЗамена деталей, которые невозможно восстановить.': 1200.0,
    },
    'Ходовая часть': {
      'Все исправно': 0,
      'Подшипники': 1000.0,
      'Амортизаторы и пружины': 1200.0,
      'Подвеска': 1500.0,
      'ШРУС': 1000.0,
      'Сайлентблоки': 1200.0,
      'Шаровые опоры': 1500.0,
      'Тормозная система': 1000.0,
      'Ступица колеса': 1200.0,
      'Тормозные колодки': 1500.0,
    },
    'Топливная система/Система выпуска газов': {
      'Все исправно': 0,
      'топливный насос': 500.0,
      'топливные фильтры 5 и 19': 300.0,
      'трубопровод 20 подачи топлива в топливный насос': 500.0,
      'карбюратор ': 300.0,
      'фильтр очистки воздуха (воздухоочиститель)': 500.0,
      'впускной трубопровод ': 300.0,
    },
    'Кузов': {
      'Все исправно': 0,
      ' капот': 2500.0,
      ' крылья, облицовки радиатора': 2200.0,
      'подножки и ряд узлов и агрегатов (внешние световые приборы': 2700.0,
      'системы климат-контроля': 2500.0,
      'устройства безопасности': 2200.0,
      'Пороги': 2700.0,
      'Задние арки кузова.': 2500.0,
      'Передние и задние фары.': 2200.0,
      'Капот двигателя.': 2700.0,
      'Крыло.': 2500.0,
      'Передний, задний бампер.': 2200.0,
    },
    'Салон': {
      'Все исправно': 0,
      'Автомобильные ремни и подушки безопасности': 300.0,
      'Бардачки и перчаточные ящики': 700.0,
      'Детали салона автомобиля, общее': 300.0,
      'Обшивки дверей, багажника, потолков, накладки': 700.0,
      'Пистоны, заглушки, крепежные элементы': 300.0,
      'Рули': 700.0,
      'Ручки кпп и ручника': 300.0,
      'Сиденья автомобильные': 700.0,
    },
    'Двери': {
      'Все исправно': 0,
      'Восстановление поверхности кузова': 400.0,
      'Замена повреждённых компонентов кузова': 600.0,
      'Устранение скрытых повреждений.': 400.0,
      'Восстановление геометрии кузова.': 600.0,
    },
    'Приборная панель/Торпеда': {
      'Все исправно': 0,
      'спидометр – указатель скорости': 800.0,
      'контрольные лампы работоспособности узлов;': 400.0,
      'общий и посуточный счетчики пробега': 800.0,
      'индикатор температуры в системе охлаждения;': 400.0,
      'индикатор уровня топлива;': 800.0,
      'тахометр – указатель оборотов двигателя.': 400.0,
      'Обшивка топреды': 800.0,
      'Трещены торпеды, потертости': 400.0,
    },
  };

  double totalCost = 0.0;

  @override
  void initState() {
    super.initState();
    // Инициализируем выбранные запчасти значениями по умолчанию (первый элемент из каждого списка)
    partsOptions.forEach((key, value) {
      selectedParts[key] = value.keys.first;
    });

    // Применяем значения из widget.car, если они есть
    int i = 0;
    for (final key in selectedParts.keys) {
      if (i < widget.car.length) {
        if (partsOptions[key]!.containsKey(widget.car[i])) {
          selectedParts[key] = widget.car[i];
        }
      }
      i++;
    }
    _calculateTotalCost();
  }

  void _showOptions(String partCategory) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return ListView.builder(
          itemCount: partsOptions[partCategory]!.length,
          itemBuilder: (context, index) {
            final entry = partsOptions[partCategory]!.entries.elementAt(index);
            return ListTile(
              title: Text(
                  '${entry.key} - ${entry.value.toStringAsFixed(2)} Рублей'),
              onTap: () {
                setState(() {
                  selectedParts[partCategory] = entry.key;
                  _calculateTotalCost();
                });
                Navigator.pop(context);
              },
            );
          },
        );
      },
    );
  }

  void _calculateTotalCost() {
    setState(() {
      totalCost = partsOptions.entries.fold<double>(0, (sum, entry) {
        return sum + partsOptions[entry.key]![selectedParts[entry.key]!]!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Детали автомобиля')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ...partsOptions.entries
                .map(
                  (entry) => GestureDetector(
                    onTap: () => _showOptions(entry.key),
                    child: Text(
                      '${entry.key}: ${selectedParts[entry.key]} - ${partsOptions[entry.key]![selectedParts[entry.key]!]?.toStringAsFixed(2) ?? '0.00'} Рублей',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                )
                .toList(),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return Dialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Container(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Общая стоимость:',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 10),
                            Text(
                              '${totalCost.toStringAsFixed(2)} Рублей',
                              style: TextStyle(fontSize: 24),
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Спасибо, что выбрали наше приложение!',
                              style: TextStyle(fontSize: 16),
                            ),
                            SizedBox(height: 20),
                            ElevatedButton(
                              onPressed: () => Navigator.of(context).pop(),
                              child: Text('OK'),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              child: Text('Показать общую стоимость'),
            ),
          ],
        ),
      ),
    );
  }
}
