import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class PageApiOne extends StatefulWidget {
  const PageApiOne({super.key});

  @override
  State<PageApiOne> createState() => _PageApiOneState();
}

class _PageApiOneState extends State<PageApiOne> {
  List<dynamic> users = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Get Api 1', 
        style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.orange,
      ),


      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (content, index) {
          final user = users[index];
          final name = user['first_name'] + " " + user['last_name'];
          final email = user['email'];
          final imageUrl = user['avatar'];
          return ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.network(imageUrl),
            ),
            title: Text(name),
            subtitle: Text(email),
          );
        },
      ),

      
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          getData();
        },
        backgroundColor: Colors.orange,
        child: Icon(
          Icons.download,
          color: Colors.white,
        ),
      ),
    );
  }



  void getData() async {
  const url = 'https://random-data-api.com/api/users/random_user?size=10';
  final uri = Uri.parse(url);
  final response = await http.get(uri);
  final body = response.body;
  final json = jsonDecode(body);
  setState(() {
    users = json;
  });
}

}



