import 'package:flutter/material.dart';
import 'package:your_project_name/MainScreen.dart';
import 'screen4.dart';

// Экран профиля
class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  _ProfileState createState() => _ProfileState();
}

UserData userData = UserData(
  lastName: '',
  firstName: '',
  middleName: '',
  gender: '',
  birthDate: '',
  email: '',
  phone: '',
  city: '',
  nationality: '',
  metroStations: '',
);

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 73, 66, 66),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, size: 25),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MainScreen()),
            );
          },
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 63, 59, 59),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10),
            Center(
              child: Row(
                children: [
                  const SizedBox(width: 20),
                  Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          spreadRadius: 3,
                          blurRadius: 4,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    children: [
                      SizedBox(
                        width: 200,
                        height: 30,
                        child: ListTile(
                            title: const Text(
                              "Редактировать",
                              style: TextStyle(
                                fontSize: 16,
                                color: Color.fromARGB(255, 88, 87, 91),
                              ),
                            ),
                            leading: const Icon(Icons.create, size: 16),
                            onTap: () {
                              Navigator.push<UserData>(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DataUpdate()),
                              ).then((updatedUserData) {
                                if (updatedUserData != null) {
                                  setState(() {
                                    userData = updatedUserData;
                                  });
                                }
                              });
                            }),
                      ),
                      const SizedBox(height: 10),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    userData.lastName.isNotEmpty
                        ? userData.lastName
                        : 'Фамилия',
                    style: const TextStyle(
                      fontSize: 18,
                      color: Color.fromARGB(255, 88, 87, 91),
                    ),
                  ),
                  const SizedBox(height: 2),
                  const Divider(
                    color: Color.fromARGB(255, 88, 87, 91),
                    height: 5,
                    thickness: 1,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    userData.firstName.isNotEmpty ? userData.firstName : 'Имя',
                    style: const TextStyle(
                      fontSize: 18,
                      color: Color.fromARGB(255, 88, 87, 91),
                    ),
                  ),
                  const SizedBox(height: 2),
                  const Divider(
                    color: Color.fromARGB(255, 88, 87, 91),
                    height: 5,
                    thickness: 1,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    userData.middleName.isNotEmpty
                        ? userData.middleName
                        : 'Отчество',
                    style: const TextStyle(
                      fontSize: 18,
                      color: Color.fromARGB(255, 88, 87, 91),
                    ),
                  ),
                  const SizedBox(height: 2),
                  const Divider(
                    color: Color.fromARGB(255, 88, 87, 91),
                    height: 5,
                    thickness: 1,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    userData.gender.isNotEmpty ? userData.gender : 'Пол',
                    style: const TextStyle(
                      fontSize: 18,
                      color: Color.fromARGB(255, 88, 87, 91),
                    ),
                  ),
                  const SizedBox(height: 2),
                  const Divider(
                    color: Color.fromARGB(255, 88, 87, 91),
                    height: 5,
                    thickness: 1,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    userData.birthDate.isNotEmpty
                        ? 'Дата рождения: ${userData.birthDate}'
                        : 'Дата рождения',
                    style: const TextStyle(
                      fontSize: 18,
                      color: Color.fromARGB(255, 88, 87, 91),
                    ),
                  ),
                  const SizedBox(height: 2),
                  const Divider(
                    color: Color.fromARGB(255, 88, 87, 91),
                    height: 5,
                    thickness: 1,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    userData.email.isNotEmpty
                        ? userData.email
                        : 'Электронная почта',
                    style: const TextStyle(
                      fontSize: 18,
                      color: Color.fromARGB(255, 88, 87, 91),
                    ),
                  ),
                  const SizedBox(height: 2),
                  const Divider(
                    color: Color.fromARGB(255, 88, 87, 91),
                    height: 5,
                    thickness: 1,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    userData.phone.isNotEmpty ? userData.phone : 'Телефон',
                    style: const TextStyle(
                      fontSize: 18,
                      color: Color.fromARGB(255, 88, 87, 91),
                    ),
                  ),
                  const SizedBox(height: 2),
                  const Divider(
                    color: Color.fromARGB(255, 88, 87, 91),
                    height: 5,
                    thickness: 1,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    userData.city.isNotEmpty ? userData.city : 'Город',
                    style: const TextStyle(
                      fontSize: 18,
                      color: Color.fromARGB(255, 88, 87, 91),
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Divider(
                    color: Color.fromARGB(255, 88, 87, 91),
                    height: 5,
                    thickness: 1,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
