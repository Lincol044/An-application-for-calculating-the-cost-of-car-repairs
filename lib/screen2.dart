import 'package:flutter/material.dart';

class Screen2 extends StatelessWidget {
  final List<String> data;

  Screen2({required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Информация о автомобиле'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(data[index], style: TextStyle(fontSize: 20)),
            );
          },
        ),
      ),
    );
  }
}
