import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          tooltip: 'Add new task',
          child: Icon(
            Icons.add,
          ),
        ),
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
              children: [
                ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/images/Login_Logo.png'),
                  ),
                  trailing: Icon(Icons.navigate_next_rounded),
                  onTap: () {
                    Navigator.pushNamed(context, '/create');
                  },
                  title: Text('Test'),
                  subtitle: Text('this is a subtitle'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
