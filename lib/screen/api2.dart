import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PageApiDuo extends StatefulWidget {
  const PageApiDuo({super.key});

  @override
  State<PageApiDuo> createState() => _PageApiDuoState();
}

class _PageApiDuoState extends State<PageApiDuo> {
  List<dynamic> users = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Get Api 2', 
        style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.blue,
        child: Icon(
          Icons.download,
          color: Colors.white,
        ),
      ),
    );
  }

  void getData() async {
  const url = 'https://fakestoreapi.com/products';
  final uri = Uri.parse(url);
  final response = await http.get(uri);
  final body = response.body;
  final json = jsonDecode(body);
  setState(() {
    users = json;
  });
}
}