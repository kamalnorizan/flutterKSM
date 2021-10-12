import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        body: Center(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Email address",
                    ),
                  ),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Password",
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('Log Masuk'),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
