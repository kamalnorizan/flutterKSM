import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
          appBar: AppBar(
            title: Text('My Home'),
            actions: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.ac_unit),
              ),
              IconButton(
                onPressed: () {},
                icon: Text('test'),
              ),
            ],
          ),
          body: Center(
            child: Container(
              color: Colors.blue,
              width: double.infinity,
              child: Column(
                children: [
                  Text('Test 1'),
                  Text('Test 2'),
                  Text('Test 3'),
                  Row(
                    children: [
                      Text('Test 1'),
                      Text('Test 2'),
                      Text('Test 3'),
                    ],
                  )
                ],
              ),
            ),
          )),
    );
  }
}
