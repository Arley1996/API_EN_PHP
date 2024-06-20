import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProductosScreen extends StatefulWidget {
  @override
  _ProductosScreenState createState() => _ProductosScreenState();
}

class _ProductosScreenState extends State<ProductosScreen> {
  List<dynamic> _productos = [];

  @override
  void initState() {
    super.initState();
    _fetchProductos();
  }

  Future<void> _fetchProductos() async {
    try {
      final response =
          await http.get(Uri.parse('http://localhost/consulta.php'));

      if (response.statusCode == 200) {
        setState(() {
          _productos = jsonDecode(response.body);
        });
      } else {
        throw Exception('Error al cargar los productos');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Productos'),
      ),
      body: ListView.builder(
        itemCount: _productos.length,
        itemBuilder: (context, index) {
          final producto = _productos[index];
          return ListTile(
            title: Text(producto['nombre']),
            subtitle: Text('Precio: \$${producto['precio']}'),
          );
        },
      ),
    );
  }
}