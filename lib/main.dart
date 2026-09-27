import 'package:flutter/material.dart';
import 'login.dart';

void main() {
  runApp(const MyApp());
}
//menempelkan widget utama (MyApp) ke layar HP.

class MyApp extends StatelessWidget {
  const MyApp({super.key});
//StatelessWidget: Berarti tampilan dasar aplikasi ini sifatnya statis (tidak memiliki status/data yang berubah secara dinamis)
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MyChaeg',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromARGB(255, 235, 227, 202),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 255, 131, 135),
        ),
        useMaterial3: true,
      ),
      home: const LoginPage(),
    );
  }
}