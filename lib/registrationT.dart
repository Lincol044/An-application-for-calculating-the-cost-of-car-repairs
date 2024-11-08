import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController birthYearController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Регистрация'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Возвращает на экран входа
          },
        ),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'ФИО',
                filled: true,
                fillColor: Colors.grey[800],
                border: OutlineInputBorder(),
                labelStyle: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                filled: true,
                fillColor: Colors.grey[800],
                border: OutlineInputBorder(),
                labelStyle: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: phoneController,
              decoration: InputDecoration(
                labelText: 'Номер телефона',
                filled: true,
                fillColor: Colors.grey[800],
                border: OutlineInputBorder(),
                labelStyle: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: birthYearController,
              decoration: InputDecoration(
                labelText: 'Год рождения',
                filled: true,
                fillColor: Colors.grey[800],
                border: OutlineInputBorder(),
                labelStyle: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Логика для регистрации
              },
              child: Text('Создать учетную запись'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pink,
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
