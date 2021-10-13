import 'package:flutter/material.dart';
import 'package:my_flutter_project/models/todo.dart';
import 'package:intl/intl.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Todo> todoList = [
    Todo(
        1,
        "My First Todo List",
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
        "2021-10-14"),
    Todo(
        2,
        "My Second Todo List",
        "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old..",
        "2021-10-15"),
    Todo(
        3,
        "My Third Todo List",
        "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words",
        "2021-10-15")
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, '/create');
          },
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
            child: Expanded(
              child: ListView.builder(
                  itemCount: todoList.length,
                  itemBuilder: (BuildContext ctxt, int Index) {
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage:
                            AssetImage('assets/images/Login_Logo.png'),
                      ),
                      trailing: Icon(Icons.navigate_next_rounded),
                      onTap: () {
                        Navigator.pushNamed(context, '/create');
                      },
                      title: Text(todoList[Index].title),
                      subtitle: Text(DateFormat('yyyy-MM-dd')
                          .parse(todoList[Index].duedate)
                          .toString()),
                    );
                  }),
            ),
          ),
        ),
      ),
    );
  }
}
