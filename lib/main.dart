import 'package:flutter/material.dart';
import 'registrationT.dart';
import 'mainScreen.dart';
import 'Continue.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginScreen(),
      theme: ThemeData.dark(),
    );
  }
}

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/gifimage.gif',
              height: 400,
              width: 1000,
            ),
            SizedBox(height: 20),
            Text(
              'Вход',
              style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Переход на экран продолжения
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ContinueScreen()),
                );
              },
              child: Text('Войти'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pink,
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              ),
            ),
            SizedBox(height: 10),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegistrationScreen()),
                );
              },
              child: Text('Нет учетной записи? Зарегистрируйтесь',
                  style: TextStyle(color: Colors.white)),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.g_mobiledata, color: Colors.white),
                  onPressed: () {
                    // Логика для входа через Google
                  },
                ),
                IconButton(
                  icon: Icon(Icons.apple, color: Colors.white),
                  onPressed: () {
                    // Логика для входа через Apple
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
