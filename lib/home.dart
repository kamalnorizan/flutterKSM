import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:my_flutter_project/models/todo.dart';
import 'package:intl/intl.dart';
import 'package:my_flutter_project/services/api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Todo>? todoList;
  String? token;
  int _loading = 1;
  @override
  void initState() {
    super.initState();
    loadTodoList();
    getToken();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            final result =
                await Navigator.pushNamed(context, '/create') as Todo;

            setState(() {
              this.todoList!.add(result);
            });
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
            IconButton(
              onPressed: () {
                loadTodoList();
              },
              icon: Icon(Icons.refresh),
            ),
          ],
        ),
        body: Center(
          child: Container(
            width: double.infinity,
            child: _loading == 1
                ? CircularProgressIndicator()
                : Expanded(
                    child: ListView.builder(
                        itemCount:
                            todoList?.length != null ? todoList!.length : 0,
                        itemBuilder: (BuildContext ctxt, int Index) {
                          return Slidable(
                            actionPane: SlidableDrawerActionPane(),
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundImage:
                                    AssetImage('assets/images/Login_Logo.png'),
                              ),
                              trailing: Icon(Icons.navigate_next_rounded),
                              onTap: () async {
                                final todo = await Navigator.pushNamed(
                                    context, '/create',
                                    arguments: todoList![Index]) as Todo;

                                setState(() {
                                  todoList![Index] = todo;
                                });
                              },
                              title: Text(todoList![Index].title),
                              subtitle: Text(DateFormat('yyyy-MM-dd')
                                  .parse(todoList![Index].dueDate)
                                  .toString()),
                            ),
                            secondaryActions: [
                              IconSlideAction(
                                caption: 'Delete',
                                color: Colors.redAccent[700],
                                icon: Icons.delete,
                                onTap: () {
                                  _showDialog(context, todoList![Index].id);
                                },
                              )
                            ],
                          );
                        }),
                  ),
          ),
        ),
      ),
    );
  }

  getToken() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();

    this.token = localStorage.getString('token');
  }

  loadTodoList() async {
    _loading = 1;
    var res = await CallApi().getData('todolist');
    var body = json.decode(res.body);
    // print(body['success']['todolist']);
    var result = body['success']['todolist'];
    print(result);
    setState(() {
      this.todoList = fromJson(json.encode(result));
      _loading = 0;
    });
  }

  _showDialog(BuildContext context, id) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Expanded(
            child: AlertDialog(
              title: Text('Alert'),
              content: Text('Adakah anda pasti untuk memadam item ini?'),
              actions: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.red),
                  onPressed: () async {
                    var data = {};

                    await CallApi()
                        .postData(data, 'todolist/delete/' + id.toString());
                    loadTodoList();
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'Ya',
                    style: TextStyle(
                      backgroundColor: Colors.redAccent,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Tidak'),
                ),
              ],
            ),
          );
        });
  }
}
