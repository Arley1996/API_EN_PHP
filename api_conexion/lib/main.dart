import 'package:flutter/material.dart';
import 'productos_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Productos',
      home: ProductosScreen(),
    );
  }
}
