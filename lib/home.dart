import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('My To-do List'),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/login');
              },
              icon: Icon(Icons.vpn_key),
            ),
          ],
        ),
        body: Center(
          child: Container(
            width: double.infinity,
            child: Column(
              children: [],
            ),
          ),
        ),
      ),
    );
  }
}
