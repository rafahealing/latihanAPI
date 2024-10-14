import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PageApiThree extends StatefulWidget {
  const PageApiThree({super.key});

  @override
  State<PageApiThree> createState() => _PageThreeApiState();
}

class _PageThreeApiState extends State<PageApiThree> {
  List<dynamic> users = [];

  @override
  void initState() {
    super.initState();
    getData(); // Call getData to fetch data when the page loads
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Get Api 3',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.pink,
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // 2 items per row
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
          childAspectRatio: 0.75, // Adjust based on your content
        ),
        itemCount: users.length,
        padding: const EdgeInsets.all(10.0),
        itemBuilder: (context, index) {
          final user = users[index];
          final title = user['title'];
          final price = user['price'].toString();
          final image = user['image'];
          final rating = user['rating']['rate'].toString() + " (" + user['rating']['count'].toString() + " reviews)";

          return Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    image,
                    height: 111,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text("Price: \$" + price),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text("Rating: " + rating),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getData,
        backgroundColor: Colors.pink,
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
