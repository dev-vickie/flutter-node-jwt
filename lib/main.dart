import 'package:flutter/material.dart';
import 'package:flutter_node_jwt/pages/login_page.dart';
import 'package:flutter_node_jwt/pages/register_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        "/": (context) => const LoginPage(),
        "/register": (context) => const RegisterPage(),
      },
    );
  }
}
