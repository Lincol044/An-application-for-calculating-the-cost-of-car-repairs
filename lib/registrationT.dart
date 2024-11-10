import 'package:flutter/material.dart';
import 'MainScreen.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _formKey = GlobalKey<FormState>(); // Ключ для валидации формы

  // Контроллеры для полей ввода
  final TextEditingController _fioController = TextEditingController();
  final TextEditingController _nicknameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Создать учетную запись'),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey, // Привязка ключа формы
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Поле ввода ФИО
              TextFormField(
                controller: _fioController,
                decoration: InputDecoration(
                  labelText: 'ФИО',
                  labelStyle: TextStyle(color: Colors.white),
                  filled: true,
                  fillColor: Colors.grey[800],
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Введите ваше ФИО';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              // Поле ввода никнейма
              TextFormField(
                controller: _nicknameController,
                decoration: InputDecoration(
                  labelText: 'Никнейм',
                  labelStyle: TextStyle(color: Colors.white),
                  filled: true,
                  fillColor: Colors.grey[800],
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Введите ваш никнейм';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              // Поле ввода почты
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Почта',
                  labelStyle: TextStyle(color: Colors.white),
                  filled: true,
                  fillColor: Colors.grey[800],
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Введите вашу почту';
                  } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return 'Введите корректный адрес электронной почты';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              // Поле ввода номера телефона
              TextFormField(
                controller: _phoneController,
                decoration: InputDecoration(
                  labelText: 'Номер телефона',
                  labelStyle: TextStyle(color: Colors.white),
                  filled: true,
                  fillColor: Colors.grey[800],
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Введите номер телефона';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              // Поле ввода пароля
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
                  } else if (value.length < 6) {
                    return 'Пароль должен содержать не менее 6 символов';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Если форма валидна, показать загрузочный экран
                    _showLoadingScreen(context);
                  }
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
              Text('Создание учетной записи...',
                  style: TextStyle(color: Colors.white)),
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
