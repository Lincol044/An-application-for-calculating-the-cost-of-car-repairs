import 'package:flutter/material.dart';
import 'warehouse.dart';

class Screen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Информация о автомобилях'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: carData.length,
          itemBuilder: (context, index) {
            return Card(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: carData[index]
                      .map((info) => Text(info, style: TextStyle(fontSize: 18)))
                      .toList(),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
