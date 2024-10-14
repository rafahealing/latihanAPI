import 'package:flutter/material.dart';
import 'package:flutter_api/screen/api1.dart';
import 'package:flutter_api/screen/api2.dart';
import 'package:flutter_api/screen/api3.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page', 
        style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.orange,
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const PageApiOne();
                  }));
                },
                child: const Text('Tombol 1'),
              ),

              const SizedBox(height: 10,),
              
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const PageApiDuo();
                  }));
                },
                child: const Text('Tombol 2'),
              ),

              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const PageApiThree();
                  }));
                },
                child: const Text('Tombol 3'),
              ),
            ],
          ),
        ),
      )
    );
  }
}