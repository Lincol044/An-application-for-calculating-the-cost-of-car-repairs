import 'package:flutter/material.dart';
import 'MainScreen.dart'; // Убедитесь, что этот импорт корректен

class ContinueScreen extends StatefulWidget {
  @override
  _ContinueScreenState createState() => _ContinueScreenState();
}

class _ContinueScreenState extends State<ContinueScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SizedBox(
            width: 300,
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildOvalTextFormField(
                    controller: _usernameController,
                    labelText: 'Имя пользователя',
                  ),
                  SizedBox(height: 16),
                  _buildOvalTextFormField(
                    controller: _passwordController,
                    labelText: 'Пароль',
                    obscureText: true,
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _showLoadingScreen(context);
                      }
                    },
                    child: Text('Продолжить'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pink,
                      padding:
                          EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildOvalTextFormField({
    required TextEditingController controller,
    required String labelText,
    bool obscureText = false,
  }) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25.0), // Радиус закругления
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.grey[800],
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: TextFormField(
          controller: controller,
          decoration: InputDecoration(
            labelText: labelText,
            labelStyle: TextStyle(color: Colors.white),
            border: InputBorder.none, // Убираем стандартную рамку
          ),
          obscureText: obscureText,
          style: TextStyle(color: Colors.white),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Поле не может быть пустым';
            }
            return null;
          },
        ),
      ),
    );
  }

  void _showLoadingScreen(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
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

    Future.delayed(Duration(seconds: 3), () {
      Navigator.of(context).pop();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MainScreen()),
      );
    });
  }
}
