import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_flutter_project/services/api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  // const Login({Key? key}) : super(key: key);
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    this.emailController.text = 'demo@gmail.com';
    this.passwordController.text = 'zLALJdqq';
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                      image: AssetImage('assets/images/Login_Logo.png'),
                      width: 300,
                    ),
                    TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Your Email address",
                      ),
                    ),
                    TextField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Password",
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          // Navigator.pushReplacementNamed(context, '/home');
                          if (emailController.text != '' &&
                              passwordController.text != '') {
                            _login(context);
                          } else {
                            print('error');
                          }
                        },
                        child: Text('Log Masuk'),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _login(context) async {
    var data = {
      'email': emailController.text,
      'password': passwordController.text
    };

    var res = await CallApi().postDataLogin(data);
    var body = json.decode(res.body);
    if (body['success'].length > 0) {
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.setString('token', body['success']['token']);
      Navigator.pushReplacementNamed(context, '/home');
    }
  }
}
