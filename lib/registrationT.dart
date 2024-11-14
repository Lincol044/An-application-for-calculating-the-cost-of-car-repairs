import 'package:flutter/material.dart';
import 'MainScreen.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _formKey = GlobalKey<FormState>();
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
          key: _formKey,
          child: SingleChildScrollView(
            // Added for scrolling if content overflows
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildOvalTextFormField(
                  controller: _fioController,
                  labelText: 'ФИО',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Введите ваше ФИО';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                _buildOvalTextFormField(
                  controller: _nicknameController,
                  labelText: 'Никнейм',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Введите ваш никнейм';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                _buildOvalTextFormField(
                  controller: _emailController,
                  labelText: 'Почта',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Введите вашу почту';
                    } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                        .hasMatch(value)) {
                      return 'Введите корректный адрес электронной почты';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                _buildOvalTextFormField(
                  controller: _phoneController,
                  labelText: 'Номер телефона',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Введите номер телефона';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                _buildOvalTextFormField(
                  controller: _passwordController,
                  labelText: 'Пароль',
                  obscureText: true,
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
      ),
    );
  }

  Widget _buildOvalTextFormField({
    required TextEditingController controller,
    required String labelText,
    bool obscureText = false,
    required String? Function(String?)? validator,
  }) {
    return ClipRRect(
      borderRadius:
          BorderRadius.circular(25.0), // Adjust the radius for ovalness
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
            border: InputBorder.none,
          ),
          obscureText: obscureText,
          style: TextStyle(color: Colors.white),
          validator: validator,
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
              Text('Создание учетной записи...',
                  style: TextStyle(color: Colors.white)),
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
