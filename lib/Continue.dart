import 'package:flutter/material.dart';
import 'MainScreen.dart';

class ContinueScreen extends StatefulWidget {
  @override
  _ContinueScreenState createState() => _ContinueScreenState();
}

class _ContinueScreenState extends State<ContinueScreen> {
  final _formKey = GlobalKey<FormState>(); // Ключ для валидации формы

  // Контроллеры для полей ввода
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey, // Привязка ключа формы
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Поле ввода для имени пользователя
              TextFormField(
                controller: _usernameController,
                decoration: InputDecoration(
                  labelText: 'Имя пользователя',
                  labelStyle: TextStyle(color: Colors.white),
                  filled: true,
                  fillColor: Colors.grey[800],
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Введите имя пользователя';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              // Поле ввода для пароля
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Пароль',
                  labelStyle: TextStyle(color: Colors.white),
                  filled: true,
                  fillColor: Colors.grey[800],
                ),
                obscureText: true, // Скрыть текст пароля
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Введите пароль';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Если форма валидна, показываем загрузочный экран с задержкой
                    _showLoadingScreen(context);
                  }
                },
                child: Text('Продолжить'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink,
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showLoadingScreen(BuildContext context) {
    // Показать окно с задержкой 3 секунды
    showDialog(
      context: context,
      barrierDismissible: false, // Окно нельзя закрыть, нажав вне его
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.black,
          content: Row(
            children: [
              CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.pink),
              ),
              SizedBox(width: 20),
              Text('Вход..', style: TextStyle(color: Colors.white)),
            ],
          ),
        );
      },
    );

    // Задержка на 3 секунды
    Future.delayed(Duration(seconds: 3), () {
      Navigator.of(context).pop(); // Закрыть диалог
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MainScreen()),
      );
    });
  }
}
